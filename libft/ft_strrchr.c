/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amaroni <amaroni@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/20 12:10:08 by amaroni           #+#    #+#             */
/*   Updated: 2021/10/24 19:01:21 by amaroni          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(char *s, int c)
{
	int	i;

	i = 0;
	while (*(s + i) != '\0')
		i++;
	while ((i > 0) && *(s + i) != (char)c)
		i--;
	if (*(s + i) == (char)c)
		return (s + i);
	else
		return (NULL);
}
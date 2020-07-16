Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1D020222E7B
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jul 2020 00:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594937972;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tKlO59E20fTELZphdzr2nw6IbqQbL2hkuGp8Jo7oRJg=;
	b=XmIBRHg5ri92OsmYX+edrsWHqWf5XTEv/QQ6dOHpuWH0JY4GhVOQ1uLTJUt8GSFkhh3Efy
	ydXR9NSNhf2vjGg866dh241xw8AqErXTqnycbUoFMwGBZNOf5AaRtMfaENw7KG/uh+TQ7w
	+RKQO0mN4/IuqL5yFmYgzAj6PbM+Ibk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-Ng81qwbqNgywEY0CoabM3Q-1; Thu, 16 Jul 2020 18:19:30 -0400
X-MC-Unique: Ng81qwbqNgywEY0CoabM3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DAE08015F7;
	Thu, 16 Jul 2020 22:19:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B584872E6D;
	Thu, 16 Jul 2020 22:19:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3A0D1809554;
	Thu, 16 Jul 2020 22:19:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06GMIqGp021750 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 18:18:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9F5E5D9E4; Thu, 16 Jul 2020 22:18:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EAA85D9E7;
	Thu, 16 Jul 2020 22:18:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06GMImuf023366; 
	Thu, 16 Jul 2020 17:18:48 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06GMImOU023365;
	Thu, 16 Jul 2020 17:18:48 -0500
Date: Thu, 16 Jul 2020 17:18:48 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200716221848.GN11089@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-13-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709101620.6786-13-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 12/35] libmultipath: strlcpy()/strlcat(): use
 restrict qualifier
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:15:57PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Also remove the redundant local variables. It's not necessary to
> make "restrict" work, but it makes the intention more clear.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/util.c | 28 ++++++++++++----------------
>  libmultipath/util.h |  4 ++--
>  2 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index 957fb97..f965094 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -113,46 +113,42 @@ get_word (const char *sentence, char **word)
>  	return skip + len;
>  }
>  
> -size_t strlcpy(char *dst, const char *src, size_t size)
> +size_t strlcpy(char * restrict dst, const char * restrict src, size_t size)
>  {
>  	size_t bytes = 0;
> -	char *q = dst;
> -	const char *p = src;
>  	char ch;
>  
> -	while ((ch = *p++)) {
> -		if (bytes+1 < size)
> -			*q++ = ch;
> +	while ((ch = *src++)) {
> +		if (bytes + 1 < size)
> +			*dst++ = ch;
>  		bytes++;
>  	}
>  
>  	/* If size == 0 there is no space for a final null... */
>  	if (size)
> -		*q = '\0';
> +		*dst = '\0';
>  	return bytes;
>  }
>  
> -size_t strlcat(char *dst, const char *src, size_t size)
> +size_t strlcat(char * restrict dst, const char * restrict src, size_t size)
>  {
>  	size_t bytes = 0;
> -	char *q = dst;
> -	const char *p = src;
>  	char ch;
>  
> -	while (bytes < size && *q) {
> -		q++;
> +	while (bytes < size && *dst) {
> +		dst++;
>  		bytes++;
>  	}
>  	if (bytes == size)

this should return the strlen(dst) + strlen(src). It wouldn't in the
admittedly weird case where size isn't large enough to fit dst.

>  		return (bytes + strlen(src));
>  
> -	while ((ch = *p++)) {
> -		if (bytes+1 < size)
> -		*q++ = ch;
> +	while ((ch = *src++)) {
> +		if (bytes + 1 < size)
> +			*dst++ = ch;
>  		bytes++;
>  	}
>  
> -	*q = '\0';
> +	*dst = '\0';
>  	return bytes;
>  }
>  
> diff --git a/libmultipath/util.h b/libmultipath/util.h
> index ae18d8b..7e29b26 100644
> --- a/libmultipath/util.h
> +++ b/libmultipath/util.h
> @@ -15,8 +15,8 @@ int basenamecpy (const char *src, char *dst, size_t size);
>  int filepresent (const char *run);
>  char *get_next_string(char **temp, const char *split_char);
>  int get_word (const char * sentence, char ** word);
> -size_t strlcpy(char *dst, const char *src, size_t size);
> -size_t strlcat(char *dst, const char *src, size_t size);
> +size_t strlcpy(char * restrict dst, const char * restrict src, size_t size);
> +size_t strlcat(char * restrict dst, const char * restrict src, size_t size);
>  int devt2devname (char *, int, const char *);
>  dev_t parse_devt(const char *dev_t);
>  char *convert_dev(char *dev, int is_path_device);
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


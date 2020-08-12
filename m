Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EE28D242E5D
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 20:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597255368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q8MOMt6JhjSoOmVynfJlL++CrjN4F5c/UFL5n5ya1Yw=;
	b=ihC017cvuaz7QHyZELZXazUoqKlLogul/2Cvvx2lbecUFX2LxGsFIZJLatpJp6jQXzIZ3L
	Ek8yysxY+ogPIubpaEbb/Cr4F3akbsa6h7H9iU55nJG/t0SuR1ZBHJ1Uv5BSqJOOYTjj/T
	IioFc2ootK8LXZzpywbr1UtFwwatQKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-On9fz1ljM6WBeoen0O1vCg-1; Wed, 12 Aug 2020 14:02:46 -0400
X-MC-Unique: On9fz1ljM6WBeoen0O1vCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C10A2102C7EC;
	Wed, 12 Aug 2020 18:02:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9E2F5D9E4;
	Wed, 12 Aug 2020 18:02:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B6999A031;
	Wed, 12 Aug 2020 18:02:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CI1MvA020503 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 14:01:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80F95600DD; Wed, 12 Aug 2020 18:01:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F5AA600D4;
	Wed, 12 Aug 2020 18:01:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07CI1HZm021914; 
	Wed, 12 Aug 2020 13:01:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07CI1HJM021913;
	Wed, 12 Aug 2020 13:01:17 -0500
Date: Wed, 12 Aug 2020 13:01:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200812180117.GV19233@octiron.msp.redhat.com>
References: <20200812113232.25962-1-mwilck@suse.com>
	<20200812113232.25962-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113232.25962-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 12/35] libmultipath: strlcpy()/strlcat():
 use restrict qualifier
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:32:32PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Also remove the redundant local variables. It's not necessary to
> make "restrict" work, but it makes the intention more clear.
> 

Clearly, the way you wrote strlcat agrees with other implementations,
so it's fine.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/util.c | 28 ++++++++++++----------------
>  libmultipath/util.h |  4 ++--
>  2 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index 526869e..207e63c 100644
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
> index a4f7c0a..52aa559 100644
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
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


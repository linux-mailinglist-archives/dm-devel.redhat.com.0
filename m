Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C122E30C91C
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 19:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612289510;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A/MJhQF9ksPcL6v9XDN9qfMmRQ7MwHM8d6bMSAREs5g=;
	b=cCQDfA2k8fhpY7ltB2qOk7gjPYTq5EYxGvxbqz7/4DSwVun07Y9Bt2jId20ZE/DPEi1Vbo
	iQIq1UklwWjHINZkaT33dEbWHxrKD3gm2FdglFmLoCbxRn+m1HyA1coG/m5qvrsps3oAo4
	Ffuf1WaO4/k3XZr9mQFIuXiJMRVhqoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-pKDJO1kxPOiO76kiiUFkiA-1; Tue, 02 Feb 2021 13:11:48 -0500
X-MC-Unique: pKDJO1kxPOiO76kiiUFkiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6CD0107ACE8;
	Tue,  2 Feb 2021 18:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D64525B4A6;
	Tue,  2 Feb 2021 18:11:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF72850038;
	Tue,  2 Feb 2021 18:11:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112IAd1p023634 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 13:10:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF0152BFC7; Tue,  2 Feb 2021 18:10:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E5DA50EDE;
	Tue,  2 Feb 2021 18:10:36 +0000 (UTC)
Date: Tue, 2 Feb 2021 13:10:35 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210202181035.GA14886@redhat.com>
References: <20210122084321.24012-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210122084321.24012-1-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov <dbaryshkov@gmail.com>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	kernel@pengutronix.de, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm crypt: replaced #if defined with
	IS_ENABLED
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 22 2021 at  3:43am -0500,
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> IS_ENABLED(CONFIG_ENCRYPTED_KEYS) is true whether the option is built-in
> or a module, so use it instead of #if defined checking for each
> separately.
> 
> The other #if was to avoid a static function defined, but unused
> warning. As we now always build the callsite when the function
> is defined, we can remove that first #if guard.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
> ---
>  drivers/md/dm-crypt.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 8c874710f0bc..7eeb9248eda5 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -2436,7 +2436,6 @@ static int set_key_user(struct crypt_config *cc, struct key *key)
>  	return 0;
>  }
>  
> -#if defined(CONFIG_ENCRYPTED_KEYS) || defined(CONFIG_ENCRYPTED_KEYS_MODULE)
>  static int set_key_encrypted(struct crypt_config *cc, struct key *key)
>  {
>  	const struct encrypted_key_payload *ekp;
> @@ -2452,7 +2451,6 @@ static int set_key_encrypted(struct crypt_config *cc, struct key *key)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_ENCRYPTED_KEYS */
>  
>  static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string)
>  {
> @@ -2482,11 +2480,10 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
>  	} else if (!strncmp(key_string, "user:", key_desc - key_string + 1)) {
>  		type = &key_type_user;
>  		set_key = set_key_user;
> -#if defined(CONFIG_ENCRYPTED_KEYS) || defined(CONFIG_ENCRYPTED_KEYS_MODULE)
> -	} else if (!strncmp(key_string, "encrypted:", key_desc - key_string + 1)) {
> +	} else if (IS_ENABLED(CONFIG_ENCRYPTED_KEYS) &&
> +		   !strncmp(key_string, "encrypted:", key_desc - key_string + 1)) {
>  		type = &key_type_encrypted;
>  		set_key = set_key_encrypted;
> -#endif
>  	} else {
>  		return -EINVAL;
>  	}
> -- 
> 2.30.0
> 

I could be mistaken but the point of the previous way used to enable
this code was to not compile the code at all.  How you have it, the
branch just isn't taken but the compiled code is left to bloat dm-crypt.

Why not leave this as is and follow same pattern in your next patch?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


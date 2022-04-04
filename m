Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C44F1A2A
	for <lists+dm-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649105129;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4PafR/jN0PiPdxodchFlTWsNQ8HVzBU6IFhzL4gL91o=;
	b=BZtM6BmffrPGDeysxalasZ5RVtOzpbS4ndb7++D0VrLP9YlzPB8A+WGwvL9FLZQ7tLaOaB
	uL3Tn29D+Hfr7UfC2DbFUlnE6syhBaDoeaRJbUQKHP+VAguXVwQss1CYBzz9+xAyp7M8aX
	TywVdQ5kRnazzM6hIueK7b1OqEYcISQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-fIleQ6UtONaOg880u7dkkw-1; Mon, 04 Apr 2022 16:45:25 -0400
X-MC-Unique: fIleQ6UtONaOg880u7dkkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA3F101A52C;
	Mon,  4 Apr 2022 20:45:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB3B8145;
	Mon,  4 Apr 2022 20:45:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76FE11940374;
	Mon,  4 Apr 2022 20:45:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CFB1D19451EF
 for <dm-devel@listman.corp.redhat.com>; Mon,  4 Apr 2022 20:45:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B4A84087D61; Mon,  4 Apr 2022 20:45:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5484087D60;
 Mon,  4 Apr 2022 20:45:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 234KjEQS032048;
 Mon, 4 Apr 2022 15:45:14 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 234KjDrh032047;
 Mon, 4 Apr 2022 15:45:13 -0500
Date: Mon, 4 Apr 2022 15:45:13 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220404204513.GB24684@octiron.msp.redhat.com>
References: <20220404170457.16021-1-mwilck@suse.com>
 <20220404170457.16021-16-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220404170457.16021-16-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v2 15/15] libmultipath: avoid memory leak
 with uid_attrs
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 04, 2022 at 07:04:57PM +0200, mwilck@suse.com wrote:
> Free all vector elements when freeing uid_attrs.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@rehdat.com>

> ---
>  libmultipath/config.c | 5 +++++
>  libmultipath/dict.c   | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 7346c37..bfaf041 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -656,6 +656,9 @@ static struct config *alloc_config (void)
>  
>  static void _uninit_config(struct config *conf)
>  {
> +	void *ptr;
> +	int i;
> +
>  	if (!conf)
>  		conf = &__internal_config;
>  
> @@ -668,6 +671,8 @@ static void _uninit_config(struct config *conf)
>  	if (conf->uid_attribute)
>  		free(conf->uid_attribute);
>  
> +	vector_foreach_slot(&conf->uid_attrs, ptr, i)
> +		free(ptr);
>  	vector_reset(&conf->uid_attrs);
>  
>  	if (conf->getuid)
> diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> index 26cbe78..3b99296 100644
> --- a/libmultipath/dict.c
> +++ b/libmultipath/dict.c
> @@ -597,8 +597,13 @@ static int uid_attrs_handler(struct config *conf, vector strvec,
>  			     const char *file, int line_nr)
>  {
>  	char *val;
> +	void *ptr;
> +	int i;
>  
> +	vector_foreach_slot(&conf->uid_attrs, ptr, i)
> +		free(ptr);
>  	vector_reset(&conf->uid_attrs);
> +
>  	val = set_value(strvec);
>  	if (!val)
>  		return 1;
> -- 
> 2.35.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


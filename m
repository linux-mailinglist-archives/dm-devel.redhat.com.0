Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC502479E9
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 00:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597702003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qJNIyXd7yLCKKHC8Jssm11kWiPT8yAC+H6dzZcWM/tQ=;
	b=O0YTPDhcdFJyE76YdsJef8Mc7TuzlpVS6O3DW8crTy89HHQunITqImptz+Eqaa1AHn8a5W
	CbAOQy20gfkK84zNe9xeZ4K2RY5QPpTOQeptzISeH+++xPCnzSoYPI/fnKXi7cxDhQWopD
	1Qw8WGmMYcqyq7F3uNloemojMhGRQDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-1BfHUQjOOZaRO7MXU5oDhQ-1; Mon, 17 Aug 2020 18:06:38 -0400
X-MC-Unique: 1BfHUQjOOZaRO7MXU5oDhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E252A8064B2;
	Mon, 17 Aug 2020 22:06:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CBC819C4F;
	Mon, 17 Aug 2020 22:06:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B2264EE1C;
	Mon, 17 Aug 2020 22:06:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HM6CKL016397 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 18:06:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92AB35C64D; Mon, 17 Aug 2020 22:06:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 153AD5C3E1;
	Mon, 17 Aug 2020 22:06:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07HM67wi023478; 
	Mon, 17 Aug 2020 17:06:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07HM67Zp023477;
	Mon, 17 Aug 2020 17:06:07 -0500
Date: Mon, 17 Aug 2020 17:06:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200817220606.GL19233@octiron.msp.redhat.com>
References: <20200812113601.26658-1-mwilck@suse.com>
	<20200812113601.26658-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113601.26658-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 83/84] libmultipath: alias: static const
 variable for BINDINGS_FILE_HEADER
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:36:00PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> ... and fixup the header file.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 17 ++++++++++++++---
>  libmultipath/alias.h | 12 ++++--------
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index 35f1beb..0759c4e 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -37,6 +37,17 @@
>   * See the file COPYING included with this distribution for more details.
>   */
>  
> +#define BINDINGS_FILE_HEADER		\
> +"# Multipath bindings, Version : 1.0\n" \
> +"# NOTE: this file is automatically maintained by the multipath program.\n" \
> +"# You should not need to edit this file in normal circumstances.\n" \
> +"#\n" \
> +"# Format:\n" \
> +"# alias wwid\n" \
> +"#\n"
> +
> +static const char bindings_file_header[] = BINDINGS_FILE_HEADER;
> +
>  int
>  valid_alias(const char *alias)
>  {
> @@ -287,7 +298,7 @@ use_existing_alias (const char *wwid, const char *file, const char *alias_old,
>  	char buff[WWID_SIZE];
>  	FILE *f;
>  
> -	fd = open_file(file, &can_write, BINDINGS_FILE_HEADER);
> +	fd = open_file(file, &can_write, bindings_file_header);
>  	if (fd < 0)
>  		return NULL;
>  
> @@ -361,7 +372,7 @@ get_user_friendly_alias(const char *wwid, const char *file, const char *prefix,
>  		return NULL;
>  	}
>  
> -	fd = open_file(file, &can_write, BINDINGS_FILE_HEADER);
> +	fd = open_file(file, &can_write, bindings_file_header);
>  	if (fd < 0)
>  		return NULL;
>  
> @@ -406,7 +417,7 @@ get_user_friendly_wwid(const char *alias, char *buff, const char *file)
>  		return -1;
>  	}
>  
> -	fd = open_file(file, &unused, BINDINGS_FILE_HEADER);
> +	fd = open_file(file, &unused, bindings_file_header);
>  	if (fd < 0)
>  		return -1;
>  
> diff --git a/libmultipath/alias.h b/libmultipath/alias.h
> index 7c4b302..236b3ba 100644
> --- a/libmultipath/alias.h
> +++ b/libmultipath/alias.h
> @@ -1,11 +1,5 @@
> -#define BINDINGS_FILE_HEADER \
> -"# Multipath bindings, Version : 1.0\n" \
> -"# NOTE: this file is automatically maintained by the multipath program.\n" \
> -"# You should not need to edit this file in normal circumstances.\n" \
> -"#\n" \
> -"# Format:\n" \
> -"# alias wwid\n" \
> -"#\n"
> +#ifndef _ALIAS_H
> +#define _ALIAS_H
>  
>  int valid_alias(const char *alias);
>  char *get_user_friendly_alias(const char *wwid, const char *file,
> @@ -15,3 +9,5 @@ int get_user_friendly_wwid(const char *alias, char *buff, const char *file);
>  char *use_existing_alias (const char *wwid, const char *file,
>  			  const char *alias_old,
>  			  const char *prefix, int bindings_read_only);
> +
> +#endif /* _ALIAS_H */
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


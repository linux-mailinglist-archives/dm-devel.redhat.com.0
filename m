Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC879DC53
	for <lists+dm-devel@lfdr.de>; Wed, 13 Sep 2023 01:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694559662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4hHSdoZGoVhsvBsjmndk7Vkev6Q4AXXIORO96kQ/5lY=;
	b=ehs0iKpbBPYw21zJGabRmPv5G3FxA2ijC0uL25hLI12Vox1bhu2T5vNTbStyiqpa+xDoB8
	LFXbutrXM/3Sg09tvKBhmIttCJ7nWRUwfr6bjwoF/FazLZKUtFhVL0T8OoY5oyRFeUS/Fk
	WKUCrW6Hat5dMT22G/fbiEL050m7QSg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-NCNfb-ccNx6CBdX-4DuJbQ-1; Tue, 12 Sep 2023 19:00:34 -0400
X-MC-Unique: NCNfb-ccNx6CBdX-4DuJbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 296F7181A6E7;
	Tue, 12 Sep 2023 23:00:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F13122026D68;
	Tue, 12 Sep 2023 23:00:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4738D19465B8;
	Tue, 12 Sep 2023 23:00:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4F4F0194658D
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Sep 2023 23:00:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0D66840C6EBF; Tue, 12 Sep 2023 23:00:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7E340C6EA8;
 Tue, 12 Sep 2023 23:00:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 38CN0009031042;
 Tue, 12 Sep 2023 18:00:00 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 38CN00r0031041;
 Tue, 12 Sep 2023 18:00:00 -0500
Date: Tue, 12 Sep 2023 17:59:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230912225959.GN7412@octiron.msp.redhat.com>
References: <20230911163846.27197-1-mwilck@suse.com>
 <20230911163846.27197-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230911163846.27197-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v2 02/37] libmultipath: add
 alias_already_taken()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 11, 2023 at 06:38:11PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Factor out a trivial helper function.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index c0139a2..83ded88 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -8,6 +8,7 @@
>  #include <string.h>
>  #include <limits.h>
>  #include <stdio.h>
> +#include <stdbool.h>
>  
>  #include "debug.h"
>  #include "util.h"
> @@ -109,30 +110,35 @@ scan_devname(const char *alias, const char *prefix)
>  	return n;
>  }
>  
> -static int
> -id_already_taken(int id, const char *prefix, const char *map_wwid)
> +static bool alias_already_taken(const char *alias, const char *map_wwid)
>  {
> -	STRBUF_ON_STACK(buf);
> -	const char *alias;
>  
> -	if (append_strbuf_str(&buf, prefix) < 0 ||
> -	    format_devname(&buf, id) < 0)
> -		return 0;
> -
> -	alias = get_strbuf_str(&buf);
>  	if (dm_map_present(alias)) {
>  		char wwid[WWID_SIZE];
>  
>  		/* If both the name and the wwid match, then it's fine.*/
>  		if (dm_get_uuid(alias, wwid, sizeof(wwid)) == 0 &&
>  		    strncmp(map_wwid, wwid, sizeof(wwid)) == 0)
> -			return 0;
> -		condlog(3, "%s: alias '%s' already taken, but not in bindings file. reselecting alias", map_wwid, alias);
> -		return 1;
> +			return false;
> +		condlog(3, "%s: alias '%s' already taken, but not in bindings file. reselecting alias",
> +			map_wwid, alias);
> +		return true;
>  	}
> -	return 0;
> +	return false;
>  }
>  
> +static bool id_already_taken(int id, const char *prefix, const char *map_wwid)
> +{
> +	STRBUF_ON_STACK(buf);
> +	const char *alias;
> +
> +	if (append_strbuf_str(&buf, prefix) < 0 ||
> +	    format_devname(&buf, id) < 0)
> +		return false;
> +
> +	alias = get_strbuf_str(&buf);
> +	return alias_already_taken(alias, map_wwid);
> +}
>  
>  /*
>   * Returns: 0   if matching entry in WWIDs file found
> -- 
> 2.42.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


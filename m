Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8455224A98E
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 00:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597876870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NmlBAdCnljoV1jjjDFjKf6ENI96lZmgie1sfvPhGcbw=;
	b=R6ooNOM7D9mHY+LtGYsfTNsnn+mnRdEOQ6uO3sNXnBbQcmKTJQB6JP0iQmuSQyUDcKyhRY
	be/NTS9kRyluItQggJX0hpem33Quus/OIptb/stNqIJV29/RnV8KAnNkKWcTbPDTHg5JtT
	OHnT728HmIw0frNDMoB0ElxMWm/KvNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-eKjd2Dl1Ni-c940-GLoWUA-1; Wed, 19 Aug 2020 18:41:08 -0400
X-MC-Unique: eKjd2Dl1Ni-c940-GLoWUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE0781885D82;
	Wed, 19 Aug 2020 22:40:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77E0469C9D;
	Wed, 19 Aug 2020 22:40:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 939B81832FC2;
	Wed, 19 Aug 2020 22:40:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JMeKlU022091 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 18:40:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D505216D4B; Wed, 19 Aug 2020 22:40:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0E419C4F;
	Wed, 19 Aug 2020 22:40:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07JMeGUT007178; 
	Wed, 19 Aug 2020 17:40:16 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07JMeFrT007177;
	Wed, 19 Aug 2020 17:40:15 -0500
Date: Wed, 19 Aug 2020 17:40:15 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200819224015.GW19233@octiron.msp.redhat.com>
References: <20200819131819.13493-1-mwilck@suse.com>
	<20200819131819.13493-5-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200819131819.13493-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 87/87] libmultipath: fix a
 -Wformat-truncation warning from gcc 10
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 19, 2020 at 03:18:19PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This fixes a warning seen with gcc 10 on x86 (32 bit).
> Fix it by checking the snprintf() return value.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/util.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index 207e63c..1512424 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -250,9 +250,9 @@ int systemd_service_enabled_in(const char *dev, const char *prefix)
>  		p = d->d_name + strlen(d->d_name) - 6;
>  		if (strcmp(p, ".wants"))
>  			continue;
> -		snprintf(file, sizeof(file), "%s/%s/%s",
> -			 path, d->d_name, service);
> -		if (stat(file, &stbuf) == 0) {
> +		if (!safe_sprintf(file, "%s/%s/%s",
> +				  path, d->d_name, service)
> +		    && stat(file, &stbuf) == 0) {
>  			condlog(3, "%s: found %s", dev, file);
>  			found++;
>  			break;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


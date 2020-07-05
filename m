Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E70E5214F4E
	for <lists+dm-devel@lfdr.de>; Sun,  5 Jul 2020 22:30:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-DMoe67oqONSgLHzop6JYFw-1; Sun, 05 Jul 2020 16:30:44 -0400
X-MC-Unique: DMoe67oqONSgLHzop6JYFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD01218A0760;
	Sun,  5 Jul 2020 20:30:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D000810013DB;
	Sun,  5 Jul 2020 20:30:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BEC81809547;
	Sun,  5 Jul 2020 20:30:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065KUHKV026352 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 16:30:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E97EC110F0A1; Sun,  5 Jul 2020 20:30:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AE8110F0A0
	for <dm-devel@redhat.com>; Sun,  5 Jul 2020 20:30:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB3758007AC
	for <dm-devel@redhat.com>; Sun,  5 Jul 2020 20:30:08 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-182-9rsanH4WPnmMv7D_Kkhjeg-1;
	Sun, 05 Jul 2020 16:30:04 -0400
X-MC-Unique: 9rsanH4WPnmMv7D_Kkhjeg-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 599C1846;
	Sun,  5 Jul 2020 20:30:01 +0000 (UTC)
Date: Sun, 5 Jul 2020 14:30:00 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <20200705143000.51c350b7@lwn.net>
In-Reply-To: <20200627103138.71885-1-grandmaster@al2klimov.de>
References: <20200627103138.71885-1-grandmaster@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 065KUHKV026352
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, song@kernel.org, dm-devel@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] [PATCH] Replace HTTP links with HTTPS ones: LVM
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 27 Jun 2020 12:31:38 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Applied but...

> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index 921888df6764..30ba3573626c 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -27,7 +27,7 @@ config BLK_DEV_MD
>  
>  	  More information about Software RAID on Linux is contained in the
>  	  Software RAID mini-HOWTO, available from
> -	  <http://www.tldp.org/docs.html#howto>. There you will also learn
> +	  <https://www.tldp.org/docs.html#howto>. There you will also learn

This HOWTO, once one finds it beyond that link, starts by saying:

	This HOWTO is deprecated; the Linux RAID HOWTO is maintained as a
	wiki by the linux-raid community at http://raid.wiki.kernel.org/

So clearly adding HTTPS isn't really the optimal fix here...

jon


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


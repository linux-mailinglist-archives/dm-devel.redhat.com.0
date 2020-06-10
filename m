Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 17AAE1F544E
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jun 2020 14:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591791099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4LrEFnl0w6XHlT7r0yHQ+iWoEbHv1iSsTGqY/glSsI0=;
	b=Ffe0M/frIvywm+iEPxQhDivVMe546dBX1Up3UbODUHarxUc+Oi/QlrYh5BiGu3wz66wTIx
	TDgFwY1ZFfI+VxEf9JLf+hkWuzBVxqJIWaPJahI6g/fQv1q8u+Rbl0UnxUGzRFe38m0EnO
	PCO4eGifCWn1fSaom8ahI34MIZTx5Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-8Lkj23FsPyOtr5zpKDSFKQ-1; Wed, 10 Jun 2020 08:11:36 -0400
X-MC-Unique: 8Lkj23FsPyOtr5zpKDSFKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2EED18FE860;
	Wed, 10 Jun 2020 12:11:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 274DC1A4D9;
	Wed, 10 Jun 2020 12:11:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A63B71809547;
	Wed, 10 Jun 2020 12:11:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05ACBGFh003067 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 08:11:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24DC68FF62; Wed, 10 Jun 2020 12:11:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-19.bne.redhat.com [10.64.54.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 262A28FF6B;
	Wed, 10 Jun 2020 12:11:13 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jizZT-0001e7-0V; Wed, 10 Jun 2020 22:11:08 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Wed, 10 Jun 2020 22:11:07 +1000
Date: Wed, 10 Jun 2020 22:11:07 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200610121106.GA23137@gondor.apana.org.au>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, linux-crypto@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] crypto API and GFP_ATOMIC
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 10, 2020 at 08:02:23AM -0400, Mikulas Patocka wrote:
>
> Yes, fixing the drivers would be the best - but you can hardly find any 
> person who has all the crypto hardware and who is willing to rewrite all 
> the drivers for it.

We don't have to rewrite them straight away.  We could mark the
known broken ones (or the known working ones) and then dm-crypt
can allocate only those using the types/mask to crypto_alloc.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC641ECFB9
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 14:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591187204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=StYEhnkHbdXvMHOjF9L3Y3kKwc2fwKbzjN+PqfqY6vg=;
	b=JoI3gGaqcR4HfWria4Xct3HBmcVLywBIiH03tAvLprPkxfsfYYB0xKVrQlAXuQ6/Q+gUVG
	vLRzOB/BXsRfWIHQFdJRpx409IT9/2PIYh4h/hStSu9/5S8lW/qohOfQ/dIdu/QGjWZtZZ
	I3dP8IgmwCHNqOq8AkL/yLtCW85QPrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-yrpVKv1TPxi7K78WeXOWUQ-1; Wed, 03 Jun 2020 08:26:41 -0400
X-MC-Unique: yrpVKv1TPxi7K78WeXOWUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F51580058E;
	Wed,  3 Jun 2020 12:26:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F23111A9F4;
	Wed,  3 Jun 2020 12:26:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B5F297024;
	Wed,  3 Jun 2020 12:26:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 053CQ6tu013986 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 08:26:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01A572DE99; Wed,  3 Jun 2020 12:26:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-19.bne.redhat.com [10.64.54.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA79946;
	Wed,  3 Jun 2020 12:26:02 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jgSSg-0004RW-1G; Wed, 03 Jun 2020 22:25:39 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Wed, 03 Jun 2020 22:25:38 +1000
Date: Wed, 3 Jun 2020 22:25:38 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200603122537.GA31719@gondor.apana.org.au>
References: <20200601160418.171851200@debian-a64.vm>
	<20200602220516.GA20880@silpixa00400314>
	<alpine.LRH.2.02.2006030409520.15292@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006030409520.15292@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, guazhang@redhat.com,
	Mike Snitzer <msnitzer@redhat.com>, djeffery@redhat.com,
	qat-linux@intel.com, jpittman@redhat.com, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] qat: fix misunderstood -EBUSY return code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 03, 2020 at 04:31:54AM -0400, Mikulas Patocka wrote:
>
> > Should we just retry a number of times and then fail?
> 
> It's better to get stuck in an infinite loop than to cause random I/O 
> errors. The infinite loop requires reboot, but it doesn't damage data on 
> disks.
> 
> The proper solution would be to add the request to a queue and process the 
> queue when some other request ended - but it would need substantial 
> rewrite of the driver. Do you want to rewrite it using a queue?
> 
> > Or, should we just move to the crypto-engine?
> 
> What do you mean by the crypto-engine?

crypto-engine is the generic queueing mechanism that any crypto
driver can use to implement the queueing.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


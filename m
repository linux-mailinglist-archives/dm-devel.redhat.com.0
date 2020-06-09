Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 348391F41E4
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jun 2020 19:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591722860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xlu9Qo1G0pIEN4l85kqJ15auLX+aoenIZ6olbr82tJk=;
	b=ba3YLl/cPRtdd7QE7yzw0JAJDMmumGT4/PpMdzbWL5kpYcz0Pil4YpbisJeR27zIE6S/qK
	egbJTnXZpO1zw6MSSH+gDrq4E0bd1bvBTP5w/2kfiOZJ9LNnPfBnJJ4e5KoJhxnqCeX3Rn
	TSkDIHJmfy2PrSckumZ6P1nsx3X6/b4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-GPjZxzf6NNul-ifpg4jxyA-1; Tue, 09 Jun 2020 13:14:18 -0400
X-MC-Unique: GPjZxzf6NNul-ifpg4jxyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6B48BFC1;
	Tue,  9 Jun 2020 17:14:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1228C7A1EB;
	Tue,  9 Jun 2020 17:14:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DAD8CB349D;
	Tue,  9 Jun 2020 17:13:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059HBHR7030501 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:11:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 271345C3FD; Tue,  9 Jun 2020 17:11:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D6B25F9DC;
	Tue,  9 Jun 2020 17:11:07 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 059HB6Tw031653; Tue, 9 Jun 2020 13:11:06 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 059HB6RA031649; Tue, 9 Jun 2020 13:11:06 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 9 Jun 2020 13:11:05 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Message-ID: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-kernel@vger.kernel.org, Mike Snitzer <msnitzer@redhat.com>,
	linux-crypto@vger.kernel.org, dm-devel@redhat.com,
	Milan Broz <mbroz@redhat.com>
Subject: [dm-devel] crypto API and GFP_ATOMIC
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

Hi

I've found out that a lot of hardware crypto drivers use GFP_ATOMIC. Some 
of them switch between GFP_ATOMIC and GFP_KERNEL based on the flag 
CRYPTO_TFM_REQ_MAY_SLEEP.

dm-crypt and dm-integrity don't use CRYPTO_TFM_REQ_MAY_SLEEP (because 
GFP_KERNEL allocation requests can recurse back to the block device 
drivers and cause deadlocks).

So, basically, the crypto requests submitted by dm-crypt and dm-integrity 
can fail anytime. I'd like to ask, how to handle these random -ENOMEM 
return codes. If we pass -ENOMEM back to the block device stack, it could 
cause random I/O errors and data corruption.

The question is - if the crypto request returns -ENOMEM, could we sleep 
and retry it? I thought about it - the problem could be, if the crypto 
requests proceeds hafway through and then returns -ENOMEM, and if we 
retried it, it would cause data corruption, because part of the data would 
be decrypted twice.

Is it safe to assume that when we get -ENOMEM, the crypto driver didn't 
modify anything?

Do you have another idea how to solve this problem?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


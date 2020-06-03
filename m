Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BDD121ED71F
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 21:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591214179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1p5u85JiCoE032LFcBywXvLRlVEA3890kpQ0I7/3Re0=;
	b=RQ+XzTSC0lZi973by9MrPyV6i68N/iLmn2wVQihHhhaGkjFMotWRVOafNT0VPMuRPnCMDJ
	0VoyAnudLRM7tMmHObCRaLSIZyhakHaorDkZ4H1xpYoJLJniTSEKaX5qG4XnHjjRKDuhSO
	K90fT0Lp/VuS5ah5tscggPx7x6Zmy7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-OOro_-m8NkqZPWfo_stlLw-1; Wed, 03 Jun 2020 15:56:17 -0400
X-MC-Unique: OOro_-m8NkqZPWfo_stlLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FC5A0C00;
	Wed,  3 Jun 2020 19:56:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F13119C58;
	Wed,  3 Jun 2020 19:56:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B1EC1809543;
	Wed,  3 Jun 2020 19:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 053JsDbZ021848 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 15:54:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C74771A921; Wed,  3 Jun 2020 19:54:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A022419C58;
	Wed,  3 Jun 2020 19:54:10 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 053JsAO2014032; Wed, 3 Jun 2020 15:54:10 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 053Js9Us014024; Wed, 3 Jun 2020 15:54:09 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 3 Jun 2020 15:54:09 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
In-Reply-To: <20200603165526.GA94360@silpixa00400314>
Message-ID: <alpine.LRH.2.02.2006031553170.9890@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200601160418.171851200@debian-a64.vm>
	<20200602220516.GA20880@silpixa00400314>
	<alpine.LRH.2.02.2006030409520.15292@file01.intranet.prod.int.rdu2.redhat.com>
	<20200603165526.GA94360@silpixa00400314>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, Mike Snitzer <msnitzer@redhat.com>,
	djeffery@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
	ahsan.atta@intel.com, qat-linux@intel.com, jpittman@redhat.com,
	dm-devel@redhat.com, linux-crypto@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 3 Jun 2020, Giovanni Cabiddu wrote:

> > > > +bool adf_should_back_off(struct adf_etr_ring_data *ring)
> > > > +{
> > > > +	return atomic_read(ring->inflights) > ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size) * 15 / 16;
> > > How did you came up with 15/16?
> > 
> > I want the sender to back off before the queue is full, to avoid 
> > busy-waiting. There may be more concurrent senders, so we want to back off 
> > at some point before the queue is full.
> Yes, I understood this. My question was about the actual number.
> 93% of the depth of the queue.

I just guessed the value. If you have some benchmark, you can try 
different values, to test if they perform better.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


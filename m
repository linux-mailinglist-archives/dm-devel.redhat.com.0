Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E1D971ECB9F
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 10:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591173156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nSgTy9Z/Q+iUuJjtgsHIipEhIqniSjIjHOdue6To+uQ=;
	b=EbB5zWymha854BZbXqMqyv8B+LuHrGn2IxkwmQi/PVtogkuBbFrBzatHIicJzyW57vsgp5
	XhG7aUWIVkFcTR+f26Sh0TZ3eeAiZNQFKVVm6PGpacJE/xiRHpZz4rbgtlrenYj2v9Iaah
	jr8A9tzY2Ea7IMk3IW8ZK+S+Bbiy698=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-mLJ06JdFMV65KP6It2s9Ww-1; Wed, 03 Jun 2020 04:32:34 -0400
X-MC-Unique: mLJ06JdFMV65KP6It2s9Ww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C07691883609;
	Wed,  3 Jun 2020 08:32:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B14CD0206;
	Wed,  3 Jun 2020 08:32:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74F441809542;
	Wed,  3 Jun 2020 08:32:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0538VwIF026575 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 04:31:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F5EE2DE74; Wed,  3 Jun 2020 08:31:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FD2519C4F;
	Wed,  3 Jun 2020 08:31:55 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0538VshI016653; Wed, 3 Jun 2020 04:31:54 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0538VsTC016649; Wed, 3 Jun 2020 04:31:54 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 3 Jun 2020 04:31:54 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
In-Reply-To: <20200602220516.GA20880@silpixa00400314>
Message-ID: <alpine.LRH.2.02.2006030409520.15292@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200601160418.171851200@debian-a64.vm>
	<20200602220516.GA20880@silpixa00400314>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, Mike Snitzer <msnitzer@redhat.com>,
	djeffery@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
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



On Tue, 2 Jun 2020, Giovanni Cabiddu wrote:

> Hi Mikulas,
> 
> thanks for your patch. See below.
> 
> > +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> > +again:
> > +	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> >  	if (ret == -EAGAIN) {
> > -		qat_alg_free_bufl(ctx->inst, qat_req);
> > -		return -EBUSY;
> > +		qat_req->backed_off = backed_off = 1;
> > +		cpu_relax();
> > +		goto again;
> >  	}
> I am a bit concerned about this potential infinite loop.
> If an error occurred on the device and the queue is full, we will be
> stuck here forever.
> Should we just retry a number of times and then fail?

It's better to get stuck in an infinite loop than to cause random I/O 
errors. The infinite loop requires reboot, but it doesn't damage data on 
disks.

The proper solution would be to add the request to a queue and process the 
queue when some other request ended - but it would need substantial 
rewrite of the driver. Do you want to rewrite it using a queue?

> Or, should we just move to the crypto-engine?

What do you mean by the crypto-engine?

> > -	do {
> > -		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> > -	} while (ret == -EAGAIN && ctr++ < 10);
> > -
> > +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> checkpatch: line over 80 characters - same in every place
> adf_should_back_off is used.

Recently, Linus announced that we can have larger lines than 80 bytes.
See bdc48fa11e46f867ea4d75fa59ee87a7f48be144

> >  static int qat_alg_skcipher_blk_decrypt(struct skcipher_request *req)
> > Index: linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/crypto/qat/qat_common/adf_transport.c
> > +++ linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
> > @@ -114,10 +114,19 @@ static void adf_disable_ring_irq(struct
> >  	WRITE_CSR_INT_COL_EN(bank->csr_addr, bank->bank_number, bank->irq_mask);
> >  }
> >  
> > +bool adf_should_back_off(struct adf_etr_ring_data *ring)
> > +{
> > +	return atomic_read(ring->inflights) > ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size) * 15 / 16;
> How did you came up with 15/16?

I want the sender to back off before the queue is full, to avoid 
busy-waiting. There may be more concurrent senders, so we want to back off 
at some point before the queue is full.

> checkpatch: WARNING: line over 80 characters
> 
> > +}
> > +
> >  int adf_send_message(struct adf_etr_ring_data *ring, uint32_t *msg)
> >  {
> > -	if (atomic_add_return(1, ring->inflights) >
> > -	    ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size)) {
> > +	int limit = ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size);
> > +
> > +	if (atomic_read(ring->inflights) >= limit)
> > +		return -EAGAIN;

> Can this be removed and leave only the condition below?
> Am I missing something here?

atomic_read is light, atomic_add_return is heavy. We may be busy-waiting 
here, so I want to use the light instruction. Spinlocks do the same - when 
they are spinning, they use just a light "read" instruction and when the 
"read" instruction indicates that the spinlock is free, they execute the 
read-modify-write instruction to actually acquire the lock.

> > +
> > +	if (atomic_add_return(1, ring->inflights) > limit) {
> >  		atomic_dec(ring->inflights);
> >  		return -EAGAIN;
> >  	}

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


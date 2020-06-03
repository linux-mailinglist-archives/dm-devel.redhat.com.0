Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E59951F03BA
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402452;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J5M/GVDWLeB+PFfpxntJS72ZKwfEc//WT1UGELrJxJc=;
	b=XvgYSD3Nc5baMeDY+Pv+b+ibr5UW+JOw1ZkaT1Ctabdys0UrHLeRwlDMkoBECi3dWCnzpb
	RPrWsLjfKqg15YhYMrtsCmowy6yoQfUSC26KFDeWUq1Nfv+2Qc02OsXfM99RlAr+NLf3Cs
	U09q9DETTVXcUbcG5zWLFiDZ7XSrKS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-EFGiYOWgPTuBZZe2kVDqFQ-1; Fri, 05 Jun 2020 20:14:09 -0400
X-MC-Unique: EFGiYOWgPTuBZZe2kVDqFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B6AC188360D;
	Sat,  6 Jun 2020 00:14:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88E15891C2;
	Sat,  6 Jun 2020 00:13:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDE3A1809547;
	Sat,  6 Jun 2020 00:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 053Gtk0o005818 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 12:55:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 843E82156A51; Wed,  3 Jun 2020 16:55:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18D802156A4D
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 16:55:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2C40833B49
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 16:55:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-E7N3VXDqNSuJ48xgd46ctg-1; Wed, 03 Jun 2020 12:55:38 -0400
X-MC-Unique: E7N3VXDqNSuJ48xgd46ctg-1
IronPort-SDR: P16e4Bo2Kgtps8hRsiFZxv/TdbdKvaGYyq/0t4tyDGFBrJhMptYgUfgGqYbqpzKQyWc7MHQc8f
	3UfuXTzhgP/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	03 Jun 2020 09:55:35 -0700
IronPort-SDR: WKRqeYFKUfkwnW818PUa6ufHD74xo5iNMbK21IndAdRMGpgmRrNkc9slLaTer08ETd5LEx+3cr
	pZXY/xIMwwWA==
X-IronPort-AV: E=Sophos;i="5.73,468,1583222400"; d="scan'208";a="445179678"
Received: from silpixa00400314.ir.intel.com (HELO silpixa00400314)
	([10.237.222.51]) by orsmga005-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 09:55:33 -0700
Date: Wed, 3 Jun 2020 17:55:26 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200603165526.GA94360@silpixa00400314>
References: <20200601160418.171851200@debian-a64.vm>
	<20200602220516.GA20880@silpixa00400314>
	<alpine.LRH.2.02.2006030409520.15292@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006030409520.15292@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 09:30:21 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mikulas,

On Wed, Jun 03, 2020 at 04:31:54AM -0400, Mikulas Patocka wrote:
> On Tue, 2 Jun 2020, Giovanni Cabiddu wrote:
> > Hi Mikulas,
> > 
> > thanks for your patch. See below.
> > 
> > > +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> > > +again:
> > > +	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> > >  	if (ret == -EAGAIN) {
> > > -		qat_alg_free_bufl(ctx->inst, qat_req);
> > > -		return -EBUSY;
> > > +		qat_req->backed_off = backed_off = 1;
> > > +		cpu_relax();
> > > +		goto again;
> > >  	}
> > I am a bit concerned about this potential infinite loop.
> > If an error occurred on the device and the queue is full, we will be
> > stuck here forever.
> > Should we just retry a number of times and then fail?
> 
> It's better to get stuck in an infinite loop than to cause random I/O 
> errors. The infinite loop requires reboot, but it doesn't damage data on 
> disks.
Fair.

> 
> The proper solution would be to add the request to a queue and process the 
> queue when some other request ended
This is tricky. We explored a solution that was enqueuing to a sw queue
when the hw queue was full and then re-submitting in the callback.
Didn't work due to response ordering.

> - but it would need substantial 
> rewrite of the driver. Do you want to rewrite it using a queue?
We are looking at using the crypto-engine for this. However, since that
patch is not ready, we can use your solution for the time being.
I asked our validation team to run our regression suite on your patch
set.

> > Or, should we just move to the crypto-engine?
> What do you mean by the crypto-engine?
Herbert answered already this question :-)
https://www.kernel.org/doc/html/latest/crypto/crypto_engine.html

> > > -	do {
> > > -		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> > > -	} while (ret == -EAGAIN && ctr++ < 10);
> > > -
> > > +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> > checkpatch: line over 80 characters - same in every place
> > adf_should_back_off is used.
> 
> Recently, Linus announced that we can have larger lines than 80 bytes.
> See bdc48fa11e46f867ea4d75fa59ee87a7f48be144
>From bdc48fa11 I see that "80 columns is certainly still _preferred_".
80 is still my preference.
I can fix this and send a v2.

> 
> > >  static int qat_alg_skcipher_blk_decrypt(struct skcipher_request *req)
> > > Index: linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
> > > ===================================================================
> > > --- linux-2.6.orig/drivers/crypto/qat/qat_common/adf_transport.c
> > > +++ linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
> > > @@ -114,10 +114,19 @@ static void adf_disable_ring_irq(struct
> > >  	WRITE_CSR_INT_COL_EN(bank->csr_addr, bank->bank_number, bank->irq_mask);
> > >  }
> > >  
> > > +bool adf_should_back_off(struct adf_etr_ring_data *ring)
> > > +{
> > > +	return atomic_read(ring->inflights) > ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size) * 15 / 16;
> > How did you came up with 15/16?
> 
> I want the sender to back off before the queue is full, to avoid 
> busy-waiting. There may be more concurrent senders, so we want to back off 
> at some point before the queue is full.
Yes, I understood this. My question was about the actual number.
93% of the depth of the queue.

> > checkpatch: WARNING: line over 80 characters
> > 
> > > +}
> > > +
> > >  int adf_send_message(struct adf_etr_ring_data *ring, uint32_t *msg)
> > >  {
> > > -	if (atomic_add_return(1, ring->inflights) >
> > > -	    ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size)) {
> > > +	int limit = ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size);
> > > +
> > > +	if (atomic_read(ring->inflights) >= limit)
> > > +		return -EAGAIN;
> 
> > Can this be removed and leave only the condition below?
> > Am I missing something here?
> 
> atomic_read is light, atomic_add_return is heavy. We may be busy-waiting 
> here, so I want to use the light instruction. Spinlocks do the same - when 
> they are spinning, they use just a light "read" instruction and when the 
> "read" instruction indicates that the spinlock is free, they execute the 
> read-modify-write instruction to actually acquire the lock.
Ok makes sense. Thanks.

Regards,

-- 
Giovanni

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


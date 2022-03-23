Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A262A4E4CE4
	for <lists+dm-devel@lfdr.de>; Wed, 23 Mar 2022 07:48:03 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-SpEm2OyzP6a2LNVeqkZyTg-1; Wed, 23 Mar 2022 02:47:10 -0400
X-MC-Unique: SpEm2OyzP6a2LNVeqkZyTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EFE71C05EC2;
	Wed, 23 Mar 2022 06:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 107F1C26E9A;
	Wed, 23 Mar 2022 06:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5CC711940355;
	Wed, 23 Mar 2022 06:47:07 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E752B1949762
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Mar 2022 06:47:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D7E1D1410DD5; Wed, 23 Mar 2022 06:47:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D44361400E6F
 for <dm-devel@redhat.com>; Wed, 23 Mar 2022 06:47:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C02943C02B83
 for <dm-devel@redhat.com>; Wed, 23 Mar 2022 06:47:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-Dxf0eEoQN9CzC8Gdyi96NA-1; Wed, 23 Mar 2022 02:46:58 -0400
X-MC-Unique: Dxf0eEoQN9CzC8Gdyi96NA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 043A868B05; Wed, 23 Mar 2022 07:46:55 +0100 (CET)
Date: Wed, 23 Mar 2022 07:46:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20220323064654.GB24874@lst.de>
References: <20220322194927.42778-1-snitzer@kernel.org>
 <20220322194927.42778-2-snitzer@kernel.org> <20220322195414.GA8650@lst.de>
 <Yjouh9C7MaVrTnLh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yjouh9C7MaVrTnLh@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH 1/3] block: allow BIOSET_PERCPU_CACHE use
 from bio_alloc_clone
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>, ming.lei@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 22, 2022 at 04:16:07PM -0400, Mike Snitzer wrote:
> I did initially think it worthwhile to push the use of
> bio_alloc_percpu_cache() down to bio_alloc_bioset() rather than
> bio_alloc_clone() -- but I started slower with more targetted change
> for DM's needs.

Note that the nvme io_uring passthrough patches also want a non-kiocb
cached alloc version.  That code isn't quite ready yet but shows we'll
need something there as well.

> And yeah, since there isn't a REQ_ flag equivalent for IOCB_ALLOC_CACHE
> (other than just allowing all REQ_POLLED access) there isn't a
> meaningful way to limit access to the bioset's percpu cache.
> 
> Curious: how do bio_alloc_kiocb() callers know when it appropriate to
> set IOCB_ALLOC_CACHE or not?  Seems io_uring is only one and it
> unilaterally does:
> kiocb->ki_flags |= IOCB_HIPRI | IOCB_ALLOC_CACHE;

Yes, an uring deals with making sure they are freed in the same place.

> So like IOCB_HIPRI maps to REQ_POLL, should IOCB_ALLOC_CACHE map to
> REQ_ALLOC_CACHE? Or better name?

The name sounds good fine, and I just it would be best done by
lifting BIO_PERCPU_CACHE to the REQ_ namespace and ensure it is
cleared by the bio allocator if the percpu cache isn't actually
used.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


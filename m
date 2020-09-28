Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC8727B6C6
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 23:00:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-w-Jn7uUaPNWskhn92p6ByQ-1; Mon, 28 Sep 2020 16:59:59 -0400
X-MC-Unique: w-Jn7uUaPNWskhn92p6ByQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C57800683;
	Mon, 28 Sep 2020 20:59:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC31D10013C0;
	Mon, 28 Sep 2020 20:59:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0E081826D2A;
	Mon, 28 Sep 2020 20:59:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SKxgHG024224 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 16:59:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71B6E2156A30; Mon, 28 Sep 2020 20:59:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC972156A2D
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 20:59:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A90918AE948
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 20:59:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-527-UVw_-5DFO3CCWBQiuKHBlA-1;
	Mon, 28 Sep 2020 16:59:37 -0400
X-MC-Unique: UVw_-5DFO3CCWBQiuKHBlA-1
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DF42B2080A;
	Mon, 28 Sep 2020 20:59:35 +0000 (UTC)
Date: Mon, 28 Sep 2020 13:59:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200928205934.GA1340@sol.localdomain>
References: <20200916035315.34046-1-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200916035315.34046-1-ebiggers@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Miaohe Lin <linmiaohe@huawei.com>,
	dm-devel@redhat.com, Satya Tangirala <satyat@google.com>
Subject: Re: [dm-devel] [PATCH v2 0/3] block: fix up bio_crypt_ctx allocation
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 15, 2020 at 08:53:12PM -0700, Eric Biggers wrote:
> This series makes allocation of encryption contexts either able to fail,
> or explicitly require __GFP_DIRECT_RECLAIM (via WARN_ON_ONCE).
> 
> This applies to linux-block/for-next.
> 
> Changed since v1 (https://lkml.kernel.org/r/20200902051511.79821-1-ebiggers@kernel.org):
>     - Added patches 2 and 3.
>     - Added kerneldoc for bio_crypt_clone().
>     - Adjusted commit message.
> 
> Eric Biggers (3):
>   block: make bio_crypt_clone() able to fail
>   block: make blk_crypto_rq_bio_prep() able to fail
>   block: warn if !__GFP_DIRECT_RECLAIM in bio_crypt_set_ctx()

Jens, any interest in applying these patches for 5.10?

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


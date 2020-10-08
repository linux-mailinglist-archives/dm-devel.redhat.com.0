Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5648F287D31
	for <lists+dm-devel@lfdr.de>; Thu,  8 Oct 2020 22:31:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-82449VgfMo6d9qCns7Uf5g-1; Thu, 08 Oct 2020 16:31:34 -0400
X-MC-Unique: 82449VgfMo6d9qCns7Uf5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7771F1019636;
	Thu,  8 Oct 2020 20:31:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC6427CC1;
	Thu,  8 Oct 2020 20:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAB2D86BE8;
	Thu,  8 Oct 2020 20:31:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098KV7Xb024116 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 16:31:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B21B61248E4; Thu,  8 Oct 2020 20:31:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC855124579
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:31:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E61518AE943
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:31:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-362-Nxe94z_5O7KuOvB7Wrh0_Q-1;
	Thu, 08 Oct 2020 16:31:02 -0400
X-MC-Unique: Nxe94z_5O7KuOvB7Wrh0_Q-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id CC4F868B02; Thu,  8 Oct 2020 22:30:58 +0200 (CEST)
Date: Thu, 8 Oct 2020 22:30:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20201008203058.GA27821@lst.de>
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
	<CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
	<24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	martin.petersen@oracle.com, Song Liu <song@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	linux-mmc <linux-mmc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	linux-block <linux-block@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
	<linux-ide@vger.kernel.org>, dm-devel@redhat.com,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	drbd-dev@tron.linbit.com, Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [ Regressions ] linux next 20201008:
 blk_update_request: I/O error, dev sda,
 sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 08, 2020 at 02:17:41PM -0600, Jens Axboe wrote:
> Just for everyones edification, that would be these 9 patches from the
> SCSI tree:

I sent the fixes out a bit ago and Cced the reporters..

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


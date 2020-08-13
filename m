Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 19CF0243CE5
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 17:58:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-S1yQmQB3Mfi_b6VhpdW4ww-1; Thu, 13 Aug 2020 11:58:52 -0400
X-MC-Unique: S1yQmQB3Mfi_b6VhpdW4ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D9841800D41;
	Thu, 13 Aug 2020 15:58:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867255D9F3;
	Thu, 13 Aug 2020 15:58:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2F2E1826D2B;
	Thu, 13 Aug 2020 15:58:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DFwBLo030324 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 11:58:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 919374C834; Thu, 13 Aug 2020 15:58:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3345AB9C
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 15:58:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A4A0804C9D
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 15:58:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-441-qmSLnGrROga8j-Mc4kCZkQ-1; Thu, 13 Aug 2020 11:58:00 -0400
X-MC-Unique: qmSLnGrROga8j-Mc4kCZkQ-1
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1k6FHD-0008KF-JH; Thu, 13 Aug 2020 15:36:23 +0000
Date: Thu, 13 Aug 2020 16:36:23 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200813153623.GA30905@infradead.org>
References: <20200806184057.GA27858@redhat.com>
	<20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200813144811.GA5452@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>, Ewan Milne <emilne@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 13, 2020 at 10:48:11AM -0400, Mike Snitzer wrote:
> Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
> status"), among other things, fixed NVME_SC_CMD_INTERRUPTED error
> handling by changing multipathing's nvme_failover_req() to short-circuit
> path failover and then fallback to NVMe's normal error handling (which
> takes care of NVME_SC_CMD_INTERRUPTED).
> 
> This detour through native NVMe multipathing code is unwelcome because
> it prevents NVMe core from handling NVME_SC_CMD_INTERRUPTED independent
> of any multipathing concerns.
> 
> Introduce nvme_status_needs_local_error_handling() to prioritize
> non-failover retry, when appropriate, in terms of normal NVMe error
> handling.  nvme_status_needs_local_error_handling() will naturely evolve
> to include handling of any other errors that normal error handling must
> be used for.
> 
> nvme_failover_req()'s ability to fallback to normal NVMe error handling
> has been preserved because it may be useful for future NVME_SC that
> nvme_status_needs_local_error_handling() hasn't been trained for yet.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>

I don't see how this would change anything.  nvme_failover_req simply
retuns false for NVME_SC_CMD_INTERRUPTED, so your change is a no-op.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


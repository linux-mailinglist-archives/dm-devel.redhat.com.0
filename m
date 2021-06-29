Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4813B7E06
	for <lists+dm-devel@lfdr.de>; Wed, 30 Jun 2021 09:26:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-Oti6_uJNNjmbkdR1yBZowg-1; Wed, 30 Jun 2021 03:26:54 -0400
X-MC-Unique: Oti6_uJNNjmbkdR1yBZowg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F6719057C4;
	Wed, 30 Jun 2021 07:26:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F88D5D6CF;
	Wed, 30 Jun 2021 07:26:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C80A94EA2A;
	Wed, 30 Jun 2021 07:26:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15TLTWPO031186 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Jun 2021 17:29:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58CDF2044716; Tue, 29 Jun 2021 21:29:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5487E2044715
	for <dm-devel@redhat.com>; Tue, 29 Jun 2021 21:29:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC1EB800B35
	for <dm-devel@redhat.com>; Tue, 29 Jun 2021 21:29:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-526-NkseydXFPRqC2SVXTuJIlA-1;
	Tue, 29 Jun 2021 17:29:24 -0400
X-MC-Unique: NkseydXFPRqC2SVXTuJIlA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77E4C61D9F;
	Tue, 29 Jun 2021 21:23:18 +0000 (UTC)
Date: Tue, 29 Jun 2021 14:23:16 -0700
From: Keith Busch <kbusch@kernel.org>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210629212316.GA3367857@dhcp-10-100-145-180.wdc.com>
References: <20210628095210.26249-1-mwilck@suse.com>
	<20210628095210.26249-2-mwilck@suse.com>
	<20210628095341.GA4105@lst.de>
	<4fb99309463052355bb8fefe034a320085acab1b.camel@suse.com>
	<20210629125909.GB14372@lst.de>
	<2b5fd35d95668a8cba9151941c058cb8aee3e37c.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <2b5fd35d95668a8cba9151941c058cb8aee3e37c.camel@suse.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 30 Jun 2021 03:26:17 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, linux-scsi@vger.kernel.org,
	Daniel Wagner <dwagner@suse.de>, emilne@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	nkoenig@redhat.com, Bart Van Assche <Bart.VanAssche@sandisk.com>,
	Christoph Hellwig <hch@lst.de>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 1/3] scsi: scsi_ioctl: export
 __scsi_result_to_blk_status()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2021 at 09:23:18PM +0200, Martin Wilck wrote:
> On Di, 2021-06-29 at 14:59 +0200, Christoph Hellwig wrote:
> > On Mon, Jun 28, 2021 at 04:57:33PM +0200, Martin Wilck wrote:
> >=20
> > > The sg_io-on-multipath code needs to answer the question "is this a
> > > path or a target error?". Therefore it calls blk_path_error(),
> > > which
> > > requires obtaining a blk_status_t first. But that's not available
> > > in
> > > the sg_io code path. So how=A0should I deal with this situation?
> >=20
> > Not by exporting random crap from the SCSI code.
>=20
> So, you'd prefer inlining scsi_result_to_blk_status()?

I don't think you need to. The only scsi_result_to_blk_status() caller
is sg_io_to_blk_status(). That's already in the same file as
scsi_result_to_blk_status() so no need to export it. You could even make
it static.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


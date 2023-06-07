Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB27277A5
	for <lists+dm-devel@lfdr.de>; Thu,  8 Jun 2023 08:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686206957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zSve+Ihjl9g9fwhALXmxBnqJ82IN8InlfX7npBXQhyg=;
	b=Dmr8YC6wiRtxm83ctF/KN12vPmgwlvAH70TJZs0mqe0y76EYomJZ/+exJenXQ4m6+yb0Eh
	XYRF4EljaFOUVgkZr+1nJYewJvMEbtzxbkO3gZ/n/WLyz3IVnKSBxYofhiKYm8GUnzk5xN
	IbPxe/Gzb2T7NcE074jnoNsJl7PIjco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-UL9X08sOPsuhQ0fUld7gIw-1; Thu, 08 Jun 2023 02:49:16 -0400
X-MC-Unique: UL9X08sOPsuhQ0fUld7gIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 295E28007D9;
	Thu,  8 Jun 2023 06:49:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DA509E93;
	Thu,  8 Jun 2023 06:49:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E2D4F19451CD;
	Thu,  8 Jun 2023 06:48:50 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5650B19451CA
 for <dm-devel@listman.corp.redhat.com>; Wed,  7 Jun 2023 12:19:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE3689E9E; Wed,  7 Jun 2023 12:18:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C62639E9C
 for <dm-devel@redhat.com>; Wed,  7 Jun 2023 12:18:56 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABDC6811E92
 for <dm-devel@redhat.com>; Wed,  7 Jun 2023 12:18:56 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-iRcnD41gPqu1DTNBvxff2w-1; Wed, 07 Jun 2023 08:18:54 -0400
X-MC-Unique: iRcnD41gPqu1DTNBvxff2w-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id AC1196732D; Wed,  7 Jun 2023 14:18:50 +0200 (CEST)
Date: Wed, 7 Jun 2023 14:18:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230607121850.GA14396@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-31-hch@lst.de>
 <20230607-verjagen-weise-4fb3d76a6313@brauner>
MIME-Version: 1.0
In-Reply-To: <20230607-verjagen-weise-4fb3d76a6313@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 08 Jun 2023 06:48:46 +0000
Subject: Re: [dm-devel] [PATCH 30/31] block: store the holder in
 file->private_data
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, Christoph Hellwig <hch@lst.de>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 07, 2023 at 11:24:55AM +0200, Christian Brauner wrote:
> On Tue, Jun 06, 2023 at 09:39:49AM +0200, Christoph Hellwig wrote:
> > Store the file struct used as the holder in file->private_data as an
> > indicator that this file descriptor was opened exclusively to  remove
> > the last use of FMODE_EXCL.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> Feels a bit odd to store the object itself but anyway,
> Acked-by: Christian Brauner <brauner@kernel.org>

We could literally store anything we want.  The only reason I picked the
file is because: a) we have it around and b) that allows passing it
to blkdev_put without a branch in blkdev_release.

If you prefer something else I can change it.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


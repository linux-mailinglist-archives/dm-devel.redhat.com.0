Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19A4E3D72
	for <lists+dm-devel@lfdr.de>; Tue, 22 Mar 2022 12:21:11 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-vtDAC3xIPCWZsCrUc2WhnA-1; Tue, 22 Mar 2022 07:21:09 -0400
X-MC-Unique: vtDAC3xIPCWZsCrUc2WhnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E157C380450B;
	Tue, 22 Mar 2022 11:21:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD0351427AE4;
	Tue, 22 Mar 2022 11:21:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 323B11940348;
	Tue, 22 Mar 2022 11:21:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4104D1947BBC
 for <dm-devel@listman.corp.redhat.com>; Tue, 22 Mar 2022 11:21:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2ECAD4010A35; Tue, 22 Mar 2022 11:21:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ADDB403D19A
 for <dm-devel@redhat.com>; Tue, 22 Mar 2022 11:21:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 161E318A6581
 for <dm-devel@redhat.com>; Tue, 22 Mar 2022 11:21:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-tT060lSFNXyU-g8mKsz6ew-1; Tue, 22 Mar 2022 07:21:00 -0400
X-MC-Unique: tT060lSFNXyU-g8mKsz6ew-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8834368AFE; Tue, 22 Mar 2022 12:20:57 +0100 (CET)
Date: Tue, 22 Mar 2022 12:20:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.garry@huawei.com>
Message-ID: <20220322112057.GC29270@lst.de>
References: <1647945585-197349-1-git-send-email-john.garry@huawei.com>
 <1647945585-197349-4-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1647945585-197349-4-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH 03/11] libata: Send internal commands through
 the block layer
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
Cc: axboe@kernel.dk, bvanassche@acm.org, martin.petersen@oracle.com,
 chenxiang66@hisilicon.com, damien.lemoal@opensource.wdc.com,
 linux-kernel@vger.kernel.org, hch@lst.de, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, linux-scsi@vger.kernel.org,
 ming.lei@redhat.com, jejb@linux.ibm.com, beanhuo@micron.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 22, 2022 at 06:39:37PM +0800, John Garry wrote:
> When SCSI HBA device drivers are required to process an ATA internal
> command they still need a tag for the IO. This often requires the driver
> to set aside a set of tags for these sorts of IOs and manage the tags
> themselves.
> 
> If we associate a SCSI command (and request) with an ATA internal command
> then the tag is already provided, so introduce the change to send ATA
> internal commands through the block layer with a set of custom blk-mq ops.
> 
> note: I think that the timeout handling needs to be fixed up.

Any reason to not just send them through an ATA_16 passthrough CDB and
just use all the normal SCSI command handling?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


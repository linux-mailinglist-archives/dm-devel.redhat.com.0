Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC769F61B
	for <lists+dm-devel@lfdr.de>; Wed, 22 Feb 2023 15:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677074850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E/TRVoWFGbJpgfDJMsT5Vk7J044jkAZajsqeRLcAz2w=;
	b=WARWb315yFvNWbUjxjx3mLsERxKuPBIMl9lGb3O2Sz65qu9TI2Zu259D6Of8qjyPHkmZFF
	0dwDbFA2NKUP8Dg4zO21PBKzMU+NpEwygBSRJDwiyI1/rf+f0bIUm40B2sOF5ExjiKbslu
	XYsoOuhAR/dutK2YOD3sn+d/T999MCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-hg4UnO-XPg-Ulw_EwyuJoA-1; Wed, 22 Feb 2023 09:07:29 -0500
X-MC-Unique: hg4UnO-XPg-Ulw_EwyuJoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27159886067;
	Wed, 22 Feb 2023 14:07:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ADF82026D4B;
	Wed, 22 Feb 2023 14:07:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A3CF919465B1;
	Wed, 22 Feb 2023 14:07:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 502EB1946588
 for <dm-devel@listman.corp.redhat.com>; Wed, 22 Feb 2023 13:22:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 74086C15BAD; Wed, 22 Feb 2023 13:22:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C521C15BA0
 for <dm-devel@redhat.com>; Wed, 22 Feb 2023 13:22:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54DD887B2A1
 for <dm-devel@redhat.com>; Wed, 22 Feb 2023 13:22:12 +0000 (UTC)
Received: from infra.glanzmann.de (infra.glanzmann.de [88.198.237.220]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-LvINTid4MwuC3EsZT3RDDw-1; Wed, 22 Feb 2023 08:22:10 -0500
X-MC-Unique: LvINTid4MwuC3EsZT3RDDw-1
Received: by infra.glanzmann.de (Postfix, from userid 1000)
 id 56BCE7A8007D; Wed, 22 Feb 2023 14:15:19 +0100 (CET)
Date: Wed, 22 Feb 2023 14:15:19 +0100
From: Thomas Glanzmann <thomas@glanzmann.de>
To: dm-devel@redhat.com
Message-ID: <Y/YVZ61NB4aP0lHM@glanzmann.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] NetAPP AFF A220 - Debian - multipathing setup
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
Cc: team+linux-blocks@tracker.debian.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,
I have Debian bullseye connected to an AFF A220 NetApp iSCSI target with
ALUA enabled. I see two paths, however multipathd doesn't seem to
configure a multipath device for the two paths. Find the output of the
following commands here:

dpkg -l
lsblk
sg_rtpg -vvd /dev/sde
/lib/udev/scsi_id -gud /dev/sde
sg_inq -vv -p 0x83 /dev/sdd
sg_inq -vv -p 0x83 /dev/sde
multipath -T
multipath -l

https://tg.st/u/887806617717393a1e772ca0381465f4ed8311defafeaaa26433d0a7fadf5797.txt

Cheers,
        Thomas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


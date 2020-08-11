Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 56D2624191D
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 11:52:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-NebxCGMDN4aJYL0QhH6E3g-1; Tue, 11 Aug 2020 05:52:21 -0400
X-MC-Unique: NebxCGMDN4aJYL0QhH6E3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0C2DE91A;
	Tue, 11 Aug 2020 09:52:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D968AD09;
	Tue, 11 Aug 2020 09:52:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1F421809554;
	Tue, 11 Aug 2020 09:52:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B9q908015243 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 05:52:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C95810F26F8; Tue, 11 Aug 2020 09:52:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C4410F26F7
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 09:52:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B297108C269
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 09:52:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-117-dza3iohLM36zM6ceqcCZiQ-1;
	Tue, 11 Aug 2020 05:52:04 -0400
X-MC-Unique: dza3iohLM36zM6ceqcCZiQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 89A27ABE2;
	Tue, 11 Aug 2020 09:52:23 +0000 (UTC)
Message-ID: <7769b7b90b26f03536a7718501ff110cfbe1858c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: "Schremmer, Steven" <Steve.Schremmer@netapp.com>, Xose Vazquez Perez
	<xose.vazquez@gmail.com>, Benjamin Marzinski <bmarzins@redhat.com>, Hannes
	Reinecke <hare@suse.de>, DM-DEVEL ML <dm-devel@redhat.com>
Date: Tue, 11 Aug 2020 11:52:02 +0200
In-Reply-To: <DM6PR06MB5276C43B9BA875DA4B27497F8C440@DM6PR06MB5276.namprd06.prod.outlook.com>
References: <acc2f009-c4b8-0c09-c77c-9400aac38cb1@gmail.com>
	<db83c4595e4e494d95c80825b1a66dfb77e14690.camel@suse.com>
	<DM6PR06MB5276C43B9BA875DA4B27497F8C440@DM6PR06MB5276.namprd06.prod.outlook.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC] multipath-tools: *untested* use sysfs
 prio also for arrays with dual implicit/explicit alua support
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-10 at 21:27 +0000, Schremmer, Steven wrote:
> An RDAC array configured to run with Linux DM-MP should never report
> that it supports implicit and explicit ALUA support. If the array is
> configured to run with scsi_dh_rdac then it reports TPGS=0 (none) and
> should use rdac prio. The more modern configuration is to report
> TPGS=01b (implicit) and use scsi_dh_alua and alua prio.
> 
> Thanks,
> Steve

Thanks, Steve. AFAICS that means that we don't need the RFC patch.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


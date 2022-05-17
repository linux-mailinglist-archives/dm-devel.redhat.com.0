Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FE52A7F6
	for <lists+dm-devel@lfdr.de>; Tue, 17 May 2022 18:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652805147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sMWHyCoYMHhAS+qAFS6Bqu+U2NiUxoi2sjAjz3NM7nY=;
	b=S6G1oDK9P+xQ9kdyBpiciCkcYsbgehTP8joxmwZEa1PpF9EDhnoeMDTf3VItqwLkx5yYCv
	s02WJvvtR/F8+OzNnqRnFZn8t3KTfbnEWS/HCCS1JjLm7QibGgfelh/KCNZU+SCdMG9gh2
	/8lZOplT/NHBlO32Fkz9YC/ggiSPvSg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-h79jh2HIO2aQj_oQuxYRqw-1; Tue, 17 May 2022 12:32:24 -0400
X-MC-Unique: h79jh2HIO2aQj_oQuxYRqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920C5398CA71;
	Tue, 17 May 2022 16:32:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3143C2166B2D;
	Tue, 17 May 2022 16:32:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6987719259F7;
	Tue, 17 May 2022 16:32:14 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BBC2619259EC
 for <dm-devel@listman.corp.redhat.com>; Tue, 17 May 2022 16:32:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 89CC2492C14; Tue, 17 May 2022 16:32:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3823440146E;
 Tue, 17 May 2022 16:32:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 24HGWALg002161;
 Tue, 17 May 2022 11:32:10 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 24HGW9Bm002158;
 Tue, 17 May 2022 11:32:09 -0500
Date: Tue, 17 May 2022 11:32:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20220517163209.GE5254@octiron.msp.redhat.com>
References: <20220514230431.139763-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220514230431.139763-1-xose.vazquez@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH 0/9] add new devices to hw table
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
Cc: Zou Ming <zouming.zouming@huawei.com>,
 Uday Shankar <ushankar@purestorage.com>,
 NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>,
 DM-DEVEL ML <dm-devel@redhat.com>, Brian Bunker <brian@purestorage.com>,
 Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Zhouweigang <zhouweigang09@huawei.com>, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, May 15, 2022 at 01:04:31AM +0200, Xose Vazquez Perez wrote:
> Xose Vazquez Perez (9):
>   multipath-tools: fix misspellings
>   multipath-tools: add HPE Alletra 9000 NVMe to hardware table
>   multipath-tools: delete redundant ONTAP NVMe comment
>   multipath-tools: add NetApp E-Series NVMe to hardware table
>   multipath-tools: add Huawei OceanStor NVMe to hardware table
>   multipath-tools: add IBM FlashSystem(TMS RamSan) NVMe to hardware table
>   multipath-tools: add IBM FlashSystem(Storwize/SVC) NVMe to hardware table
>   multipath-tools: add Pure FlashArray NVMe to hardware table
>   multipath-tools: add Dell EMC PowerStore NVMe to hardware table

For the set:
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
>  README.md                       |  2 +-
>  libmultipath/checkers/rdac.c    |  2 +-
>  libmultipath/hwtable.c          | 60 ++++++++++++++++++++++++++++++---
>  libmultipath/prioritizers/iet.c |  2 +-
>  multipath/multipath.conf.5      |  2 +-
>  tests/directio.c                |  2 +-
>  6 files changed, 60 insertions(+), 10 deletions(-)
> 
> Cc: NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>
> Cc: Uday Shankar <ushankar@purestorage.com>
> Cc: Brian Bunker <brian@purestorage.com>
> Cc: Zhouweigang (Jack) <zhouweigang09@huawei.com>
> Cc: Zou Ming <zouming.zouming@huawei.com>
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> -- 
> 2.36.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A015AF1CD
	for <lists+dm-devel@lfdr.de>; Tue,  6 Sep 2022 19:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662484128;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o/BJG+Q4vx2xcB0MCVWcic8tbhWK5DNVeXQm30u/15A=;
	b=MlX6E+b3AcNUWQngG1IyFV1w9Y+T04rvHpvMe2/kjnS/pclCCFEayRCNIAcS/SdFPfvgib
	XRTsB+4w8CZVmF6TVQJgFpGGeOpHq2P8it22lAcg4dbIgzSV2B4tS7EFlb0xuMVwHH8WK4
	keQqFQFqCTNBaAgBdQvrWi9QHG5FyXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-dekj6rEpMZe4x84rSJgsCg-1; Tue, 06 Sep 2022 13:08:47 -0400
X-MC-Unique: dekj6rEpMZe4x84rSJgsCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64017299E76B;
	Tue,  6 Sep 2022 17:08:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 699C12166B26;
	Tue,  6 Sep 2022 17:08:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 05F171946A54;
	Tue,  6 Sep 2022 17:08:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E1A01946A45
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Sep 2022 17:08:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 14A1C1121315; Tue,  6 Sep 2022 17:08:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3AC51121314;
 Tue,  6 Sep 2022 17:08:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 286H8YuO008469;
 Tue, 6 Sep 2022 12:08:34 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 286H8Ycg008468;
 Tue, 6 Sep 2022 12:08:34 -0500
Date: Tue, 6 Sep 2022 12:08:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220906170833.GR31105@octiron.msp.redhat.com>
References: <20220903111128.14367-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220903111128.14367-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH 0/3] multipath-tools documentation fixes
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
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 03, 2022 at 01:11:25PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
For the set:
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Martin Wilck (3):
>   multipathd: add multipathc.8 manual page
>   multipathd.8: remove misleading paragraph about multipath
>   multipathd.8: Fix "SEE ALSO" section
> 
>  multipathd/multipathc.8 | 64 +++++++++++++++++++++++++++++++++++++++++
>  multipathd/multipathd.8 | 41 ++++++++++++++++++--------
>  2 files changed, 93 insertions(+), 12 deletions(-)
>  create mode 100644 multipathd/multipathc.8
> 
> -- 
> 2.37.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


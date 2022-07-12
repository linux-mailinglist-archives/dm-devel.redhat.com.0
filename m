Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DBE572662
	for <lists+dm-devel@lfdr.de>; Tue, 12 Jul 2022 21:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657655297;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Chtq+JTdoeulzKUrnZjJa3sCa2ge7xAHqK71A1I4Qiw=;
	b=N/GbsT+dX2/iMtlPzlH+nS84YZWxSFsmdqswuQAWLVdRiIkzd1NCSLKOhgzxyzAcGZ6pKs
	Z0jarKeq7OIn9hPNbU/0bjN0/xgEqOvupnyobQqJHJX+xCEIg96TBaDAZ56cDG4fUO0dga
	jQu06Qnjx1C8IWtf6nkIPDstXBxDutU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-EwdgDY0NM_23ZPA6Ow132A-1; Tue, 12 Jul 2022 15:48:16 -0400
X-MC-Unique: EwdgDY0NM_23ZPA6Ow132A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B10461C1BD27;
	Tue, 12 Jul 2022 19:48:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEC4C492C3B;
	Tue, 12 Jul 2022 19:48:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 192911947067;
	Tue, 12 Jul 2022 19:48:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B3D5194705F
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Jul 2022 19:48:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 787261121314; Tue, 12 Jul 2022 19:48:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27C791121315;
 Tue, 12 Jul 2022 19:48:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26CJm50T006624;
 Tue, 12 Jul 2022 14:48:05 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26CJm4it006622;
 Tue, 12 Jul 2022 14:48:04 -0500
Date: Tue, 12 Jul 2022 14:48:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20220712194804.GS10602@octiron.msp.redhat.com>
References: <20220709230709.35516-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220709230709.35516-1-xose.vazquez@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH 0/2] update hwtable
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
Cc: Zou Ming <zouming.zouming@huawei.com>, chengjike.cheng@huawei.com,
 DM-DEVEL ML <dm-devel@redhat.com>, sunao.sun@huawei.com,
 Christophe Varoqui <christophe.varoqui@opensvc.com>, jiangtao62@huawei.com,
 Zhouweigang <zhouweigang09@huawei.com>, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 10, 2022 at 01:07:07AM +0200, Xose Vazquez Perez wrote:
> Xose Vazquez Perez (2):
>   multipath-tools: update Huawei OceanStor NVMe vendor id
>   multipath-tools: update "Generic NVMe" vendor regex in hwtable

For the set
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
>  libmultipath/hwtable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Cc: <chengjike.cheng@huawei.com>
> Cc: <sunao.sun@huawei.com>
> Cc: <jiangtao62@huawei.com>
> Cc: Zhouweigang (Jack) <zhouweigang09@huawei.com>
> Cc: Zou Ming <zouming.zouming@huawei.com>
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> -- 
> 2.36.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D08797941E4
	for <lists+dm-devel@lfdr.de>; Wed,  6 Sep 2023 19:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694020245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O84LOzY0bdAz/gscTMKeF2DXsxfe8OPww6slqBO4kbs=;
	b=Oo+KBfMvM3dACKY7w9JJIMHfPpBPzG2+Y3vE68VRCNFSL6EebJ30hO99vFWEYPFTFf10HU
	Od01fgYKDW36zbrXmDP47dvt1CDiATnIzYkcoPxiGmN2B/f+RerVMh0bKKny6t5rspGuzL
	1CjmcUU6igsBgZZkqDN4wEM7aZf+Y3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-G9K5r5CsMZSJoztIIQ4Ihw-1; Wed, 06 Sep 2023 13:10:39 -0400
X-MC-Unique: G9K5r5CsMZSJoztIIQ4Ihw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E6E993ED6B;
	Wed,  6 Sep 2023 17:10:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0FE72026D4B;
	Wed,  6 Sep 2023 17:10:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 575C019465B3;
	Wed,  6 Sep 2023 17:10:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AA8DC194658C
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 17:10:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 890111121318; Wed,  6 Sep 2023 17:10:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C641121314
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:10:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 671241C09A48
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:10:29 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-dLLutiznOL6OkgdSC5py0Q-1; Wed,
 06 Sep 2023 13:10:25 -0400
X-MC-Unique: dLLutiznOL6OkgdSC5py0Q-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qdw2q-0040cT-0x; Wed, 06 Sep 2023 17:10:24 +0000
Date: Wed, 6 Sep 2023 18:10:24 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20230906171024.GB800259@ZenIV>
References: <59b54cc3-b98b-aff9-14fc-dc25c61111c6@redhat.com>
 <20230906-launenhaft-kinder-118ea59706c8@brauner>
 <f5d63867-5b3e-294b-d1f5-a128817cfc7@redhat.com>
 <20230906-aufheben-hagel-9925501b7822@brauner>
 <60f244be-803b-fa70-665e-b5cba15212e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <60f244be-803b-fa70-665e-b5cba15212e@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH] fix writing to the filesystem after unmount
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, dm-devel@redhat.com,
 Zdenek Kabelac <zkabelac@redhat.com>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zeniv.linux.org.uk
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 06, 2023 at 06:01:06PM +0200, Mikulas Patocka wrote:

> Perhaps we could distinguish between FIFREEZE-initiated freezes and 
> device-mapper initiated freezes as well. And we could change the logic to 
> return -EBUSY if the freeze was initiated by FIFREEZE and to wait for 
> unfreeze if it was initiated by the device-mapper.

By the time you get to cleanup_mnt() it's far too late to return -EBUSY.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE0770E930
	for <lists+dm-devel@lfdr.de>; Wed, 24 May 2023 00:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684881671;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v9+gyOkhscy4Pu0EKCPynzI1GJ2s98yNIeG+0za0M1E=;
	b=PvAaaXuCKdJ/Qft5BAh+ktoVqA1r3LgHqJkgK+QY9+oMoQV32/RCshq+pFLD71Kle5dhrR
	ZqmAZ9y2H1H8+Hjuf2wkNudKY45eT2A3lhaIBj8C/IlqXrb0wnYh/tJ+TBd+KWi0ccX5dl
	5p0Z1LvLdkyjPvljqmrmbO9bbZ/Re6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-UdG4nGSyNWOnTb7LMITXPQ-1; Tue, 23 May 2023 18:41:09 -0400
X-MC-Unique: UdG4nGSyNWOnTb7LMITXPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E516811E78;
	Tue, 23 May 2023 22:41:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C2242166B25;
	Tue, 23 May 2023 22:41:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C17CC19465BB;
	Tue, 23 May 2023 22:41:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBF8919465A8
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 22:40:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A015D9D73; Tue, 23 May 2023 22:40:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A858162
 for <dm-devel@redhat.com>; Tue, 23 May 2023 22:40:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BD673C025BE
 for <dm-devel@redhat.com>; Tue, 23 May 2023 22:40:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-86q2e2vnP42_yKSBfRUV8g-1; Tue, 23 May 2023 18:40:51 -0400
X-MC-Unique: 86q2e2vnP42_yKSBfRUV8g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03EDE6158D;
 Tue, 23 May 2023 22:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F287C4339C;
 Tue, 23 May 2023 22:40:48 +0000 (UTC)
Date: Tue, 23 May 2023 22:40:47 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "J. corwin Coburn" <corwin@redhat.com>
Message-ID: <20230523224047.GE888341@google.com>
References: <20230523214539.226387-1-corwin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523214539.226387-1-corwin@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH v2 00/39] Add the dm-vdo deduplication and
 compression device mapper target.
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
Cc: linux-block@vger.kernel.org, vdo-devel@redhat.com, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 23, 2023 at 05:45:00PM -0400, J. corwin Coburn wrote:
> The dm-vdo target provides inline deduplication, compression, zero-block
> elimination, and thin provisioning. A dm-vdo target can be backed by up to
> 256TB of storage, and can present a logical size of up to 4PB. This target
> was originally developed at Permabit Technology Corp. starting in 2009. It
> was first released in 2013 and has been used in production environments
> ever since. It was made open-source in 2017 after Permabit was acquired by
> Red Hat.

As with any kernel patchset, please mention the git commit that it applies to.
This can be done using the --base option to 'git format-patch'.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


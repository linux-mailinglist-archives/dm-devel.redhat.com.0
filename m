Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F770E89F
	for <lists+dm-devel@lfdr.de>; Wed, 24 May 2023 00:06:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684879598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hQxJs9Y5tLsUtsxLKynFB3wIrCU3p238ZF3Ww22HhFk=;
	b=SzDzIcwEcQdN5K9X1gLktvFH5Srog4QYh06HssLnxofT0j7soDB4nrIZlvsoPWCTcb4JQN
	0or2Ftz7z61mee9KvZACklCFJ5hMUf/HgkyPbxBDqPbmCM3drNb9Mg6TnRrb2RMnQSv42D
	xx4z5djIaOLuWPKL6Ddwwa/OQfUs9hU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-2lMcF_T5OuGhnMUJdeiUEA-1; Tue, 23 May 2023 18:06:36 -0400
X-MC-Unique: 2lMcF_T5OuGhnMUJdeiUEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 835B285A5B5;
	Tue, 23 May 2023 22:06:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5199140E95D;
	Tue, 23 May 2023 22:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C7E919465BB;
	Tue, 23 May 2023 22:06:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9742919465A0
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 22:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7007C2166B26; Tue, 23 May 2023 22:06:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A0F2166B25
 for <dm-devel@redhat.com>; Tue, 23 May 2023 22:06:23 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3475D101A531
 for <dm-devel@redhat.com>; Tue, 23 May 2023 22:06:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-nO0aWsc1O7uvf6Am3E4Z7w-1; Tue, 23 May 2023 18:06:21 -0400
X-MC-Unique: nO0aWsc1O7uvf6Am3E4Z7w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68720636DD;
 Tue, 23 May 2023 22:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD11EC433D2;
 Tue, 23 May 2023 22:06:19 +0000 (UTC)
Date: Tue, 23 May 2023 22:06:18 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "J. corwin Coburn" <corwin@redhat.com>
Message-ID: <20230523220618.GA888341@google.com>
References: <20230523214539.226387-1-corwin@redhat.com>
 <20230523214539.226387-3-corwin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230523214539.226387-3-corwin@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH v2 02/39] Add the MurmurHash3 fast hashing
 algorithm.
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 23, 2023 at 05:45:02PM -0400, J. corwin Coburn wrote:
> MurmurHash3 is a fast, non-cryptographic, 128-bit hash. It was originally
> written by Austin Appleby and placed in the public domain. This version has
> been modified to produce the same result on both big endian and little
> endian processors, making it suitable for use in portable persistent data.
> 
> Signed-off-by: J. corwin Coburn <corwin@redhat.com>
> ---
>  drivers/md/dm-vdo/murmurhash3.c | 175 ++++++++++++++++++++++++++++++++
>  drivers/md/dm-vdo/murmurhash3.h |  15 +++
>  2 files changed, 190 insertions(+)
>  create mode 100644 drivers/md/dm-vdo/murmurhash3.c
>  create mode 100644 drivers/md/dm-vdo/murmurhash3.h

Do we really need yet another hash algorithm?

xxHash is another very fast non-cryptographic hash algorithm that is already
available in the kernel (lib/xxhash.c).

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


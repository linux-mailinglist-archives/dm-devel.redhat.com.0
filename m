Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A1070E200
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 18:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684860216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jyY6ptTbbVO4v14WO4WwxNTAj/Qgln4yWK1uNf3b3K0=;
	b=cEFRrYvNn3A6G9DcKgeLLGnz3bVyv+6Ji1Lag6eeOTDFYv9t1fKWVr6/TGS+AUz/StchkR
	W7JmSUwSeow8ivJ0M07zqv/tBzH7mWO8cr5ENv35V2uP6uZrYRw16nM2wBLuOabp8o73Qg
	5yxHG4ObnoiULIg80im8dFF27kr/xpg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-UeqR235NNcCBI1fO14mtJA-1; Tue, 23 May 2023 12:43:34 -0400
X-MC-Unique: UeqR235NNcCBI1fO14mtJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D7E2803471;
	Tue, 23 May 2023 16:43:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE3E8492B00;
	Tue, 23 May 2023 16:43:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8EDE419465BB;
	Tue, 23 May 2023 16:43:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D22F19465A0
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 16:43:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA04B1121315; Tue, 23 May 2023 16:43:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D27661121314
 for <dm-devel@redhat.com>; Tue, 23 May 2023 16:43:18 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [170.10.128.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B74C91C07552
 for <dm-devel@redhat.com>; Tue, 23 May 2023 16:43:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-eDss7eWEOEat8VOXVw2Idg-1; Tue, 23 May 2023 12:43:17 -0400
X-MC-Unique: eDss7eWEOEat8VOXVw2Idg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15ACD62510;
 Tue, 23 May 2023 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F164DC433EF;
 Tue, 23 May 2023 16:34:41 +0000 (UTC)
Date: Tue, 23 May 2023 17:34:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <2023052330-perpetual-baritone-f867@gregkh>
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230523074535.249802-2-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH 01/24] driver core: return bool from
 driver_probe_done
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
Cc: Jens Axboe <axboe@kernel.dk>, Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 linux-pm@vger.kernel.org, Joern Engel <joern@lazybastard.org>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 23, 2023 at 09:45:12AM +0200, Christoph Hellwig wrote:
> bool is the most sensible return value for a yes/no return.  Also
> add __init as this funtion is only called from the early boot code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/dd.c             | 6 ++----
>  include/linux/device/driver.h | 2 +-
>  init/do_mounts.c              | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


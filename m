Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F456B9CBA
	for <lists+dm-devel@lfdr.de>; Tue, 14 Mar 2023 18:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678814068;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MM6zewzuBVhZKJlWAC4iOYiF1HVm+oqy9yacc9bg0PY=;
	b=dTXgkz+0WHBjbP4drTeYGpKfXOxLOggG3zJpVvLXNorpNT+Ea+yFOI7QBFCT7Cx99dHypM
	FwQeNrLxVZF6ZBOJpyHDiWDNDPv78AQnHixmyrYhgpHl3RGeal6XfQObnXuvZRa/ADBESd
	Y/AxmMDNYEws7JALyraEEaUDw/7QfVQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-OKJXvE93N7OV6WQMVY51dw-1; Tue, 14 Mar 2023 13:14:26 -0400
X-MC-Unique: OKJXvE93N7OV6WQMVY51dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5BA4857AA2;
	Tue, 14 Mar 2023 17:14:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEFFE1410F1B;
	Tue, 14 Mar 2023 17:14:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C43C19465B6;
	Tue, 14 Mar 2023 17:14:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B84C19465A0
 for <dm-devel@listman.corp.redhat.com>; Tue, 14 Mar 2023 17:14:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62FA81121315; Tue, 14 Mar 2023 17:14:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B3BA1121318
 for <dm-devel@redhat.com>; Tue, 14 Mar 2023 17:14:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 417E9101A52E
 for <dm-devel@redhat.com>; Tue, 14 Mar 2023 17:14:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-AwS42pEWOrCwXWjqyhgDpQ-1; Tue, 14 Mar 2023 13:14:03 -0400
X-MC-Unique: AwS42pEWOrCwXWjqyhgDpQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3172868B05; Tue, 14 Mar 2023 18:14:00 +0100 (CET)
Date: Tue, 14 Mar 2023 18:13:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Christie <michael.christie@oracle.com>
Message-ID: <20230314171359.GF6780@lst.de>
References: <20230224174502.321490-1-michael.christie@oracle.com>
 <20230224174502.321490-11-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230224174502.321490-11-michael.christie@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH v4 10/18] nvme: Add helper to send pr command
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, chaitanyak@nvidia.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, snitzer@kernel.org,
 linux-nvme@lists.infradead.org, james.bottomley@hansenpartnership.com,
 dm-devel@redhat.com, target-devel@vger.kernel.org, martin.petersen@oracle.com,
 kbusch@kernel.org, hch@lst.de
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

althought I'd also prefer to drop the redundant else.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


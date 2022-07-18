Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CC8577D93
	for <lists+dm-devel@lfdr.de>; Mon, 18 Jul 2022 10:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658133339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=048hKhueKYLp76lh3JyViZzgS94HCFj+EOf2UX1K1aQ=;
	b=IqT55QICNHtweijeqcKlbp7z7973/2mnajBSktT9YnNIUue4nUjtOMzENu0QQPskGowx3d
	KHnLcIc3JawcAacAP0vzTN2SjrxZ5elrNXWUwCoQT/WtQ/yJyiWFmEZErObTs0Q6k7iGPq
	/NYsWpm0bnWRUHxW8KYjWVhaYCjd89Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-5QxXIYO6NVGGe0O-pf4jUA-1; Mon, 18 Jul 2022 04:35:32 -0400
X-MC-Unique: 5QxXIYO6NVGGe0O-pf4jUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E966D18E5380;
	Mon, 18 Jul 2022 08:35:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD66CC04482;
	Mon, 18 Jul 2022 08:35:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3696D194705C;
	Mon, 18 Jul 2022 08:35:26 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA1331947054
 for <dm-devel@listman.corp.redhat.com>; Mon, 18 Jul 2022 08:35:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B8E3741136E1; Mon, 18 Jul 2022 08:35:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B53B941136E0
 for <dm-devel@redhat.com>; Mon, 18 Jul 2022 08:35:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BFDE185A7BA
 for <dm-devel@redhat.com>; Mon, 18 Jul 2022 08:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-cJneE2h-Ney1F_JLdsh4-w-1; Mon, 18 Jul 2022 04:35:22 -0400
X-MC-Unique: cJneE2h-Ney1F_JLdsh4-w-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oDJij-00B7Sq-Cj; Mon, 18 Jul 2022 05:55:05 +0000
Date: Sun, 17 Jul 2022 22:55:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Christie <michael.christie@oracle.com>
Message-ID: <YtT1uTW04BC38NSK@infradead.org>
References: <20220707202711.10836-1-michael.christie@oracle.com>
 <20220707202711.10836-3-michael.christie@oracle.com>
 <0c2c37c2-84f0-d6c7-b060-be7c5ba6dede@oracle.com>
 <YtBlLDShzLdW8xDx@redhat.com>
 <ffce063b-6afc-bf76-c429-353c70a73439@oracle.com>
MIME-Version: 1.0
In-Reply-To: <ffce063b-6afc-bf76-c429-353c70a73439@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH 2/3] dm: Start pr_reserve from the same
 starting path
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
Cc: hch@infradead.org, dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 14, 2022 at 07:34:57PM -0500, Mike Christie wrote:
> I also ran the libiscsi PGR tests. We pass all of those tests except the
> Write Exclusive and Exclusive Access tests. I don't think those reservation
> types make sense for multipath devices though. And as I write this I'm
> thinking we should add a check for these types and just return failure).

Why would any reservation type make less sense for multipath vs
non-multipath setups/

> 
> 
> > systems that don't have the requirement to pin the PR to a device?
> 
> I didn't find any real applications that use the All Registrants type of
> reservation where every registered path is a reservation holder. However,
> libiscsi has PGR tests for that type of reservation and the code works ok.

Well.  In general ALL_TG_PT would usually be the preferred method
everywhere.  But that assumes:

 1) it actually is supported by the target
 2) the target actually has a useful concept of the Linux system being
    a single initiator, which outside of a few setups like software
    only iSCSI are rarely true

so we usually have to fall back to just registering every path
separately.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


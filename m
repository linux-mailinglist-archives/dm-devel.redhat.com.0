Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E5E714381
	for <lists+dm-devel@lfdr.de>; Mon, 29 May 2023 06:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685335926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p7lMHmgGObcjR6CtpSRQY0Pf6JayGiYQoGhjH+g2vdw=;
	b=OOEmjAywYX3X2MuVKtfJIVECqgDin+rNs0rKHi87o5Jm355Bu8WVa9s6Zji7hMW6SaB/J3
	XlwzECXSaLtt9O7/Tfx+7207117213N/ndLmqE7QJSJc5hUKMUBq3BDOBZq9RP+zHRXFHu
	HnQEC98AOCSBDbYYJR2YY3HNPLjHYbY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-zPDqRnJAM2-HdGWPs8E-nQ-1; Mon, 29 May 2023 00:52:02 -0400
X-MC-Unique: zPDqRnJAM2-HdGWPs8E-nQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 642D41C0A582;
	Mon, 29 May 2023 04:52:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC7C40C6CD0;
	Mon, 29 May 2023 04:51:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC56919451C4;
	Mon, 29 May 2023 04:51:52 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 004AE19465A8
 for <dm-devel@listman.corp.redhat.com>; Fri, 26 May 2023 10:29:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9CB41121315; Fri, 26 May 2023 10:29:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C21E71121314
 for <dm-devel@redhat.com>; Fri, 26 May 2023 10:29:47 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A726C3C0F229
 for <dm-devel@redhat.com>; Fri, 26 May 2023 10:29:47 +0000 (UTC)
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-562-XG53TsilMMyqgQuMQAXuyQ-1; Fri, 26 May 2023 06:29:45 -0400
X-MC-Unique: XG53TsilMMyqgQuMQAXuyQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R281e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=durui@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VjW43MX_1685096980
Received: from localhost(mailfrom:durui@linux.alibaba.com
 fp:SMTPD_---0VjW43MX_1685096980) by smtp.aliyun-inc.com;
 Fri, 26 May 2023 18:29:41 +0800
From: Du Rui <durui@linux.alibaba.com>
To: gscrivan@redhat.com
Date: Fri, 26 May 2023 18:28:56 +0800
Message-Id: <20230526102855.36774-1-durui@linux.alibaba.com>
In-Reply-To: <87r0r6ywri.fsf@redhat.com>
References: <87r0r6ywri.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 29 May 2023 04:51:50 +0000
Subject: Re: [dm-devel] dm overlaybd: targets mapping OverlayBD image
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
Cc: durui@linux.alibaba.com, snitzer@kernel.org, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, alexl@redhat.com, hsiangkao@linux.alibaba.com,
 agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Giuseppe,

> The current OCI format, with some tweaks like (e)stargz or zstd:chunked,
> already make its content addressable and a client can retrieve only the
> subset of the files that are needed.  At the same time we maintain the
> simplicity of a tarball and it won't break existing clients.

Yes, I believe backward compatibility is very important. That's why we
have another design called foci (fast oci). It realize a virtual block
device from gzip image blobs. See the following link for details if interested.
https://github.com/containerd/accelerated-container-image/blob/main/docs/FASTOCI.md

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


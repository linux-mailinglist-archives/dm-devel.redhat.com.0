Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF0619169
	for <lists+dm-devel@lfdr.de>; Fri,  4 Nov 2022 07:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667544616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2EbQp2drCXeT48ebocBCwzAdy9covQN69e1c3fn0M48=;
	b=UsmsFNGmzuM0m7f2V65IQWtE4/ELIKloiZrO9O7icVS9H8LXWbEj5Yz/B1/PKI/wcMaE9M
	AGpWba09HVEYOpP3k+gmkP4otHydmybIkMeJoGL9UY9bS6N7GCNIbzVnAOGiMsiHcdEMkx
	jqI+nKLW7glV+4QZ7NQfCBYnaQa6VNI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-sD3g_udlMT2EQiTcnmos7Q-1; Fri, 04 Nov 2022 02:50:14 -0400
X-MC-Unique: sD3g_udlMT2EQiTcnmos7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DB862804BA5;
	Fri,  4 Nov 2022 06:50:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89C7D2166B48;
	Fri,  4 Nov 2022 06:50:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C6DB21946A46;
	Fri,  4 Nov 2022 06:50:07 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28D9E1946594
 for <dm-devel@listman.corp.redhat.com>; Thu,  3 Nov 2022 20:39:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC3B81400C3A; Thu,  3 Nov 2022 20:39:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E58C01401C23
 for <dm-devel@redhat.com>; Thu,  3 Nov 2022 20:39:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBA5985A5B6
 for <dm-devel@redhat.com>; Thu,  3 Nov 2022 20:39:37 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-pS0iFP10NUGC16vTnm9vqQ-1; Thu, 03 Nov 2022 16:39:36 -0400
X-MC-Unique: pS0iFP10NUGC16vTnm9vqQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83C46B8277B;
 Thu,  3 Nov 2022 20:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85618C433C1;
 Thu,  3 Nov 2022 20:39:30 +0000 (UTC)
Date: Thu, 3 Nov 2022 14:39:27 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <Y2Qm/yGlVbDRskkr@kbusch-mbp.dhcp.thefacebook.com>
References: <20221103152559.1909328-1-kbusch@meta.com>
 <alpine.LRH.2.21.2211031224060.10758@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2211031224060.10758@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Fri, 04 Nov 2022 06:50:05 +0000
Subject: Re: [dm-devel] [PATCH 0/3] fix direct io errors on dm-crypt
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
Cc: axboe@kernel.dk, ebiggers@kernel.org, Keith Busch <kbusch@meta.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com, stefanha@redhat.com,
 me@demsh.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 03, 2022 at 12:33:19PM -0400, Mikulas Patocka wrote:
> Hi
> 
> The patchset seems OK - but dm-integrity also has a limitation that the 
> bio vectors must be aligned on logical block size.
> 
> dm-writecache and dm-verity seem to handle unaligned bioset, but you 
> should check them anyway.
> 
> I'm not sure about dm-log-writes.

Yeah, dm-integrity definitly needs it too. This is easy enough to use
the same io_hint that I added for dm-crypt.

dm-log-writes is doing some weird things with writes that I don't think
would work with some low level drivers without the same alignment
constraint.

The other two appear to handle this fine, but I'll run everything
through some focused test cases to be sure.

In the meantime, do you want to see the remaining mappers fixed in a v2,
or are you okay if they follow after this series?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


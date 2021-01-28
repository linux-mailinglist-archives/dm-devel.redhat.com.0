Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB11D308042
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 22:10:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-SQdAoSM3O76MDjDp9o3kqw-1; Thu, 28 Jan 2021 16:10:06 -0500
X-MC-Unique: SQdAoSM3O76MDjDp9o3kqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5152802B53;
	Thu, 28 Jan 2021 21:10:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 657F160875;
	Thu, 28 Jan 2021 21:10:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC8175002D;
	Thu, 28 Jan 2021 21:09:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SL9s05017572 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 16:09:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 485E3F77BE; Thu, 28 Jan 2021 21:09:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 431E3F49D1
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 21:09:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3FF4187504B
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 21:09:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-293-_gLbDfkLMNaSTqvo_JA5Rw-1;
	Thu, 28 Jan 2021 16:09:49 -0500
X-MC-Unique: _gLbDfkLMNaSTqvo_JA5Rw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D3C20AAC6;
	Thu, 28 Jan 2021 21:09:47 +0000 (UTC)
Message-ID: <59c0a101e82dd07fd3bdf89883ed059b5565ec5e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 28 Jan 2021 22:09:47 +0100
In-Reply-To: <c7bfb222-4491-8a92-5ed5-f493c6f9bf0c@huawei.com>
References: <621a2062-b6eb-d88d-e53a-9c0a6b19cfbb@huawei.com>
	<d592fd0d5eeb2a0a865a395b456e24fc5a359ebf.camel@suse.com>
	<322a434b-9c5d-e145-3de4-e244493b4085@huawei.com>
	<e838410f254c12bfa3643a0cd3c50d31017346d0.camel@suse.com>
	<c7bfb222-4491-8a92-5ed5-f493c6f9bf0c@huawei.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, hexiaowen@huawei.com
Subject: Re: [dm-devel] [QUESTION] multipathd crash when stopping
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-01-28 at 21:17 +0800, lixiaokeng wrote:
> 
> This issue seems being different from that I described firstly.
> Do you think they are related?
> Will udev_device_unref lead to double free about first issue?

I just sent a patch, please try that.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


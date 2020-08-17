Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A452C24872F
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-0VuFbdWiMLCUsLa0ymvxLA-1; Tue, 18 Aug 2020 10:17:50 -0400
X-MC-Unique: 0VuFbdWiMLCUsLa0ymvxLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E441807332;
	Tue, 18 Aug 2020 14:17:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6DD5C64D;
	Tue, 18 Aug 2020 14:17:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C983E181A07D;
	Tue, 18 Aug 2020 14:17:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HNjhdE030138 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 19:45:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33799114F261; Mon, 17 Aug 2020 23:45:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE41114B9C5
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 23:45:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27541801779
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 23:45:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-40-NVMXQ2IqPrO_vjX4W7GZsA-1;
	Mon, 17 Aug 2020 19:45:37 -0400
X-MC-Unique: NVMXQ2IqPrO_vjX4W7GZsA-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 34CB320B4908;
	Mon, 17 Aug 2020 16:45:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 34CB320B4908
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, gmazyland@gmail.com
References: <20200812193102.18636-1-tusharsu@linux.microsoft.com>
	<20200812193102.18636-3-tusharsu@linux.microsoft.com>
	<591b5f09c7df8ef0378866eaf3afde7a7cb4e82f.camel@linux.ibm.com>
	<5275268e-2ce8-0129-b11d-8419ac384262@linux.microsoft.com>
	<97d25609b6a87f104cc88a2ff8ae52d3f2e4e387.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <0d3a1cbc-9c11-37f3-6316-01f5b43909c1@linux.microsoft.com>
Date: Mon, 17 Aug 2020 16:45:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97d25609b6a87f104cc88a2ff8ae52d3f2e4e387.camel@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/3] IMA: add policy to support measuring
 critical data from kernel components
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020-08-17 4:43 p.m., Mimi Zohar wrote:
> On Mon, 2020-08-17 at 15:27 -0700, Tushar Sugandhi wrote:
> 
>>> scripts/Lindent isn't as prevalent as it used to be, but it's still
>>> included in Documentation/process/coding-style.rst.  Use it as a guide.
>> Thanks for the pointer. We'll use scripts/Lindent going forward
> 
> Please don't change existing code to conform to it.  Use it as a
> guide/suggestion for new code.
> 
> Mimi
> 
> 
Will do.
Again, appreciate your feedback.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


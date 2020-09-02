Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 77F7A25BB3A
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:48:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-BU5qUtPjOki4pQvteX5Iuw-1; Thu, 03 Sep 2020 02:48:54 -0400
X-MC-Unique: BU5qUtPjOki4pQvteX5Iuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F4EC1DE02;
	Thu,  3 Sep 2020 06:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5278118C;
	Thu,  3 Sep 2020 06:48:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F29C679DBB;
	Thu,  3 Sep 2020 06:48:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0826oIsX025674 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 02:50:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D134F200A795; Wed,  2 Sep 2020 06:50:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBDCE200A4F4
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:50:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 524678F5E39
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:50:13 +0000 (UTC)
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-qvwWmxGSP7GB8li8VzMjeQ-1; Wed, 02 Sep 2020 02:50:10 -0400
X-MC-Unique: qvwWmxGSP7GB8li8VzMjeQ-1
Received: from dggeme751-chm.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id 7204CC567C53ADEA63F4;
	Wed,  2 Sep 2020 14:34:17 +0800 (CST)
Received: from dggeme753-chm.china.huawei.com (10.3.19.99) by
	dggeme751-chm.china.huawei.com (10.3.19.97) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1913.5; Wed, 2 Sep 2020 14:34:16 +0800
Received: from dggeme753-chm.china.huawei.com ([10.7.64.70]) by
	dggeme753-chm.china.huawei.com ([10.7.64.70]) with mapi id
	15.01.1913.007; Wed, 2 Sep 2020 14:34:16 +0800
From: linmiaohe <linmiaohe@huawei.com>
To: Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [PATCH] block: make bio_crypt_clone() return an error code
Thread-Index: AdaA8rlLEO+XAhxETkWGrxJysf7J6A==
Date: Wed, 2 Sep 2020 06:34:16 +0000
Message-ID: <b90bb41c7755452eb6f3fb3116ff9d6d@huawei.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.74]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0826oIsX025674
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 02:48:19 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] block: make bio_crypt_clone() return an
	error code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1.001999
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-CN

Satya Tangirala <satyat@google.com> wrote:
>On Tue, Sep 01, 2020 at 10:15:11PM -0700, Eric Biggers wrote:
>> From: Eric Biggers <ebiggers@google.com>
>> 
>> Callers of bio_clone_fast() may use a gfp_mask that excludes 
>> GFP_DIRECT_RECLAIM.  For example, map_request() uses GFP_ATOMIC.
>> 
>> If this were to happen, the mempool_alloc() in __bio_crypt_clone() can 
>> fail, causing a NULL dereference.
>The call to blk_crypto_rq_bio_prep() from blk_rq_prep_clone() could also fail for the same reason. So we may need to make blk_crypto_rq_bio_prep() also return a bool and handle the errors in the callers (the only other caller is I think blk_mq_bio_to_request(), which explicitly calls the function with GFP_NOIO, so maybe we could explicitly document the fact that blk_mq_bio_to_request will return true when called with a gfp_mask th
at includes GFP_DIRECT_RECLAIM, and ignore the return value in blk_mq_bio_to_request()). (And maybe we should document the same for bio_crypt_set_ctx and bio_crypt_clone?)

Agreed.
Except for above suggestions, the patch looks good for me, many thanks.

>> 
>> In reality map_request() currently never has to clone an encryption  


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


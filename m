Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F01B2B8208
	for <lists+dm-devel@lfdr.de>; Wed, 18 Nov 2020 17:39:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-_ll89kFmNzmimk-PsQQgnA-1; Wed, 18 Nov 2020 11:38:58 -0500
X-MC-Unique: _ll89kFmNzmimk-PsQQgnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F6098144E8;
	Wed, 18 Nov 2020 16:38:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9870F5C5AF;
	Wed, 18 Nov 2020 16:38:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0EC018095C9;
	Wed, 18 Nov 2020 16:38:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIGcfhY028981 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 11:38:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D73F945DA; Wed, 18 Nov 2020 16:38:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 984B06D9D6
	for <dm-devel@redhat.com>; Wed, 18 Nov 2020 16:38:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13057102F1FE
	for <dm-devel@redhat.com>; Wed, 18 Nov 2020 16:38:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-368-7DfLG6ZVNTGpSJOMj_70iQ-1; Wed, 18 Nov 2020 11:38:35 -0500
X-MC-Unique: 7DfLG6ZVNTGpSJOMj_70iQ-1
Received: from [2601:1c0:6280:3f0::bcc4]
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfQTY-0005Dn-Uf; Wed, 18 Nov 2020 16:38:33 +0000
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Mike Snitzer <snitzer@redhat.com>
References: <20201113225228.20563-1-rdunlap@infradead.org>
	<344abf76-9405-58ba-2dc4-27cab88c974d@de.ibm.com>
	<c29eeb5d-0683-49eb-f729-38b14fac7745@infradead.org>
	<20201117163147.GA27243@redhat.com> <20201118154944.GB545@redhat.com>
	<20201118160748.GA754@redhat.com>
	<7ae2b73e-e6e5-3357-11e4-efd93e93ba35@de.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3116ea60-1dc3-9c15-31ec-5ce8ef72ba1a@infradead.org>
Date: Wed, 18 Nov 2020 08:38:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7ae2b73e-e6e5-3357-11e4-efd93e93ba35@de.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] md: dm-writeback: add __noreturn to BUG-ging function
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/18/20 8:35 AM, Christian Borntraeger wrote:
> 
> 
> On 18.11.20 17:07, Mike Snitzer wrote:
>> On Wed, Nov 18 2020 at 10:49am -0500,
>> Mike Snitzer <snitzer@redhat.com> wrote:
>>
>>> I don't think my suggestion will help.. given it'd still leave
>>> persistent_memory_claim() without a return statement.
>>>
>>> Think it worthwhile to just add a dummy 'return 0;' after the BUG().
>>
>> Decided to go with this, now staged for 5.11:
>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.11&id=a1e4865b4dda7071f3707f7e551289ead66e38b1
>>
> 
> Looks like a sane solution. Thank you for following up.

Yes, thanks again.

-- 
~Randy

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


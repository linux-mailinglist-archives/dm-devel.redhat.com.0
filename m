Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B073D2B8C7D
	for <lists+dm-devel@lfdr.de>; Thu, 19 Nov 2020 08:44:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-5UBYmDvjMDuj6MKxvxCV4A-1; Thu, 19 Nov 2020 02:44:33 -0500
X-MC-Unique: 5UBYmDvjMDuj6MKxvxCV4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 669FC1005D4E;
	Thu, 19 Nov 2020 07:44:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5EE60843;
	Thu, 19 Nov 2020 07:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB8174057;
	Thu, 19 Nov 2020 07:44:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AI9NwZh024276 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 04:23:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4C4B9B17C9; Wed, 18 Nov 2020 09:23:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 466DFB07BF
	for <dm-devel@redhat.com>; Wed, 18 Nov 2020 09:23:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C063A90E429
	for <dm-devel@redhat.com>; Wed, 18 Nov 2020 09:23:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-589-zRSmq3QyNwKA1cYBbB4ETg-1;
	Wed, 18 Nov 2020 04:23:53 -0500
X-MC-Unique: zRSmq3QyNwKA1cYBbB4ETg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 004B0ABDE;
	Wed, 18 Nov 2020 09:23:51 +0000 (UTC)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201118084800.2339180-1-hch@lst.de>
	<22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
	<20201118085804.GA20384@lst.de>
	<1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
	<X7Tky/6dDN8+DrU7@kroah.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
Date: Wed, 18 Nov 2020 10:23:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <X7Tky/6dDN8+DrU7@kroah.com>
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
X-Mailman-Approved-At: Thu, 19 Nov 2020 02:44:06 -0500
Cc: linux-bcache@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] merge struct block_device and struct hd_struct
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
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18.11.2020 10:09, Greg KH wrote:
> On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
>> On 18.11.2020 09:58, Christoph Hellwig wrote:
>>> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
>>>> since this isn't the first series from you recently spamming
>>>> xen-devel, may I ask that you don't Cc entire series to lists
>>>> which are involved with perhaps just one out of the many patches?
>>>> IMO Cc lists should be compiled on a per-patch basis; the cover
>>>> letter may of course be sent to the union of all of them.
>>>
>>> No way.  Individual CCs are completely broken as they don't provide
>>> the reviewer a context.
>>
>> That's the view of some people, but not all. Context can be easily
>> established by those who care going to one of the many archives on
>> which the entire series lands. Getting spammed, however, can't be
>> avoided by the dozens or hundreds of list subscribers.
> 
> kernel patches are never "spam", sorry, but for developers to try to
> determine which lists/maintainers want to see the whole series and which
> do not is impossible.
> 
> Patches in a series are easily deleted from sane mail clients with a
> single click/keystroke all at once, they aren't a problem that needs to
> be reduced in volume.

This doesn't scale, neither in the dimension of recipients nor in
the dimension of possible sources of such series.

While it may seem small, it's also a waste of resources to have mails
sent to hundreds of even thousands of people. So while from a
technical content perspective I surely agree with you saying 'kernel
patches are never "spam"', they still are from the perspective of
what "spam mail" originally means: Mail the recipients did not want
to receive.

Jan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


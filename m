Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3D3B2B7ABC
	for <lists+dm-devel@lfdr.de>; Wed, 18 Nov 2020 10:56:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-IkxBQFj7PkW_8V_beazovg-1; Wed, 18 Nov 2020 04:56:20 -0500
X-MC-Unique: IkxBQFj7PkW_8V_beazovg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DED8015FB;
	Wed, 18 Nov 2020 09:56:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7728710013D7;
	Wed, 18 Nov 2020 09:56:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E73E59977;
	Wed, 18 Nov 2020 09:56:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AI9tsp9028375 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 04:55:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D5EC1102E09; Wed, 18 Nov 2020 09:55:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 296CD1102E08
	for <dm-devel@redhat.com>; Wed, 18 Nov 2020 09:55:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 662661021F60
	for <dm-devel@redhat.com>; Wed, 18 Nov 2020 09:55:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-340-75Aze9f6N7eYZQ4oPkJy4A-1;
	Wed, 18 Nov 2020 04:55:48 -0500
X-MC-Unique: 75Aze9f6N7eYZQ4oPkJy4A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8DCB7ABDE;
	Wed, 18 Nov 2020 09:55:46 +0000 (UTC)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201118084800.2339180-1-hch@lst.de>
	<20201118084800.2339180-20-hch@lst.de>
	<e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
	<X7TlIzxJPfa2p+Da@kroah.com>
From: Coly Li <colyli@suse.de>
Message-ID: <24c818c2-6aba-098c-0c73-0a5081175c06@suse.de>
Date: Wed, 18 Nov 2020 17:55:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
	Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <X7TlIzxJPfa2p+Da@kroah.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AI9tsp9028375
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 19/20] bcache: remove a superflous
	lookup_bdev all
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/18/20 5:10 PM, Greg KH wrote:
> On Wed, Nov 18, 2020 at 04:54:51PM +0800, Coly Li wrote:
>> On 11/18/20 4:47 PM, Christoph Hellwig wrote:
>>> Don't bother to call lookup_bdev for just a slightly different error
>>> message without any functional change.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>ist
>>
>> Hi Christoph,
>>
>> NACK. This removing error message is frequently triggered and observed,
>> and distinct a busy device and an already registered device is important
>> (the first one is critical error and second one is not).
>>
>> Remove such error message will be a functional regression.
> 
> What normal operation causes this error message to be emitted?  And what
> can a user do with it?

When there was bug and the caching or backing device was not
unregistered successfully, people could see "device busy"; and if it was
because the device registered again, it could be "already registered".
Without the different message, people may think the device is always
busy but indeed it isn't.

he motivation of the patch is OK to me, but we need to make the logical
consistent, otherwise we will have similar bug report for bogus warning
dmesg from bcache users in soon future.

Coly Li


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


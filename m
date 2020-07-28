Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id AA52D231681
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jul 2020 01:55:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-4xUZ42xXN6S1u-7DVb0pqQ-1; Tue, 28 Jul 2020 19:55:37 -0400
X-MC-Unique: 4xUZ42xXN6S1u-7DVb0pqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5F2107ACCA;
	Tue, 28 Jul 2020 23:55:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CED1319C71;
	Tue, 28 Jul 2020 23:55:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3FC8A35A3;
	Tue, 28 Jul 2020 23:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SNtELF005676 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 19:55:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 020A58289E; Tue, 28 Jul 2020 23:55:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E50FF8057B
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 23:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADC9C800399
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 23:55:11 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-393-vYNpxRcuOEuX2scLoAU5ng-1;
	Tue, 28 Jul 2020 19:55:07 -0400
X-MC-Unique: vYNpxRcuOEuX2scLoAU5ng-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id E32EF20B4908;
	Tue, 28 Jul 2020 16:55:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E32EF20B4908
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: Eric Biggers <ebiggers@kernel.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-7-deven.desai@linux.microsoft.com>
	<20200728215041.GF4053562@gmail.com>
Message-ID: <a5534f1c-8979-0cfd-3989-2567f4a29dbc@linux.microsoft.com>
Date: Tue, 28 Jul 2020 16:55:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728215041.GF4053562@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, sashal@kernel.org,
	paul@paul-moore.com, mdsakib@microsoft.com, jmorris@namei.org,
	nramas@linux.microsoft.com, serge@hallyn.com,
	pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, corbet@lwn.net, linux-kernel@vger.kernel.org,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 06/11] dm-verity: move signature check
 after tree validation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 7/28/2020 2:50 PM, Eric Biggers wrote:
> On Tue, Jul 28, 2020 at 02:36:06PM -0700, Deven Bowers wrote:
>> The CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG introduced by Jaskaran was
>> intended to be used to allow an LSM to enforce verifications for all
>> dm-verity volumes.
>>
>> However, with it's current implementation, this signature verification
>> occurs after the merkel-tree is validated, as a result the signature can
>> pass initial verification by passing a matching root-hash and signature.
>> This results in an unreadable block_device, but that has passed signature
>> validation (and subsequently, would be marked as verified).
>>
>> This change moves the signature verification to after the merkel-tree has
>> finished validation.
>>
>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
>> ---
>>   drivers/md/dm-verity-target.c     |  44 ++++------
>>   drivers/md/dm-verity-verify-sig.c | 140 ++++++++++++++++++++++--------
>>   drivers/md/dm-verity-verify-sig.h |  24 +++--
>>   drivers/md/dm-verity.h            |   2 +-
>>   4 files changed, 134 insertions(+), 76 deletions(-)
>>
>> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
>> index eec9f252e935..fabc173aa7b3 100644
>> --- a/drivers/md/dm-verity-target.c
>> +++ b/drivers/md/dm-verity-target.c
>> @@ -471,9 +471,9 @@ static int verity_verify_io(struct dm_verity_io *io)
>>   	struct bvec_iter start;
>>   	unsigned b;
>>   	struct crypto_wait wait;
>> +	int r;
>>   
>>   	for (b = 0; b < io->n_blocks; b++) {
>> -		int r;
>>   		sector_t cur_block = io->block + b;
>>   		struct ahash_request *req = verity_io_hash_req(v, io);
>>   
>> @@ -530,6 +530,16 @@ static int verity_verify_io(struct dm_verity_io *io)
>>   			return -EIO;
>>   	}
>>   
>> +	/*
>> +	 * At this point, the merkel tree has finished validating.
>> +	 * if signature was specified, validate the signature here.
>> +	 */
>> +	r = verity_verify_root_hash(v);
>> +	if (r < 0) {
>> +		DMERR_LIMIT("signature mismatch");
>> +		return r;
>> +	}
>> +
>>   	return 0;
>>   }
> 
> This doesn't make any sense.
> 
> This just moves the signature verification to some random I/O.
> 
> The whole point of dm-verity is that data is verified on demand.  You can't know
> whether any particular data or hash block is consistent with the root hash or
> not until it is read and verified.
> 
> When the first I/O completes it might have just checked one block of a billion.
> 
> Not to mention that you didn't consider locking at all.
> 
> - Eric
> 

I appear to have dangerously misunderstood how dm-verity works under the
covers. What I thought was happening here was that *this* would be where
the first I/O that completes validation and has been verified - the root
hash signature could then be checked against the root hash, and then
no-op for remaining blocks, provided the signature validates.

The reason why I was proposing moving the signature check, is that I was 
afraid of the block_device being created in dm-verity with a root-hash 
that belongs to a different device + a signature that verifies that
root-hash, would get past verity_ctr, as despite the root hash not
matching the hash tree, the signature and the root hash will be 
verified. At this point, a block_device structure would be resident in
the kernel with the security attributes I propose in the next patch in 
the series. This device would never be read successfully, but the
structure with the attribute would exist.

This felt odd because there would be a structure in the kernel with an
attribute that says it passed a security check, but the block_device is
effectively invalid.

I realize now that that's a pretty ridiculous situation because the 
theoretical attack with access to manipulate the kernel memory in such a 
way to make it viable could just override whatever is needed to make the 
exploit work, and isn't unique to dm-verity.

I'm going to drop this patch in the next iteration of this series.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 89194170072
	for <lists+dm-devel@lfdr.de>; Wed, 26 Feb 2020 14:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582725150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OkEAX2NaCMc0dzWzv7PtOMEaTMKoR74AJloSBymxkig=;
	b=giSra1dCX3PbTU9OXdPPzVmWDV7YP4o828YU1SiONuke+VgQNKR9L3Us3zLdxTgoDWjKOk
	I/0mzZCwOn6MH9MLlBX4AaBwCYtMrgAj9ESRa93UA1VQDJF7DAJcCG9EIP95j63Ozx2ub4
	BSWOZnFwVw1N+EyfvcWycmtndECCkGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171--Ryi_1VBPI6UfNsfg8KO9w-1; Wed, 26 Feb 2020 08:52:28 -0500
X-MC-Unique: -Ryi_1VBPI6UfNsfg8KO9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CDC10CE783;
	Wed, 26 Feb 2020 13:52:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF64E8AC42;
	Wed, 26 Feb 2020 13:52:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD03A84476;
	Wed, 26 Feb 2020 13:52:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PNQdrJ018602 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 18:26:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F39C10AF41A; Tue, 25 Feb 2020 23:26:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A3FE10AF419
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 23:26:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8135D800658
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 23:26:36 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15-PRmuFxUyO8eZNqNapgGy_Q-1; Tue, 25 Feb 2020 18:26:34 -0500
X-MC-Unique: PRmuFxUyO8eZNqNapgGy_Q-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01PNMc1P018859; Tue, 25 Feb 2020 23:26:17 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2ydct3034a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2020 23:26:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01PNGcH2149500; Tue, 25 Feb 2020 23:26:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 2ydcs8h6bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2020 23:26:16 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01PNQFFM012171;
	Tue, 25 Feb 2020 23:26:15 GMT
Received: from [10.159.230.155] (/10.159.230.155)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 Feb 2020 15:26:15 -0800
To: Dan Williams <dan.j.williams@intel.com>, Jeff Moyer <jmoyer@redhat.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<CAPcyv4ghusuMsAq8gSLJKh1fiKjwa8R_-ojVgjsttoPRqBd_Sg@mail.gmail.com>
	<x49blpop00m.fsf@segfault.boston.devel.redhat.com>
	<CAPcyv4gCA_oR8_8+zhAhMnqOga9GcpMX97S+x8_UD6zLEQ0Cew@mail.gmail.com>
	<x49sgizodni.fsf@segfault.boston.devel.redhat.com>
	<CAPcyv4gUM47QgGKvK4ZVUek6f=ABT7hRFX47-DQiD6AcrxtRHA@mail.gmail.com>
From: Jane Chu <jane.chu@oracle.com>
Organization: Oracle Corporation
Message-ID: <f4085f6f-8305-2e50-fffc-07f5fc116017@oracle.com>
Date: Tue, 25 Feb 2020 15:26:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gUM47QgGKvK4ZVUek6f=ABT7hRFX47-DQiD6AcrxtRHA@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9542
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	phishscore=0 bulkscore=0
	spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=8 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002250162
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9542
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 bulkscore=0
	impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
	adultscore=0
	phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=8 clxscore=1011
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002250162
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:52:14 -0500
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
 pmem_clear_poison() to accept arbitrary offset and len
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 2/24/2020 4:26 PM, Dan Williams wrote:
> On Mon, Feb 24, 2020 at 1:53 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>
>>>> Let's just focus on reporting errors when we know we have them.
>>>
>>> That's the problem in my eyes. If software needs to contend with
>>> latent error reporting then it should always contend otherwise
>>> software has multiple error models to wrangle.
>>
>> The only way for an application to know that the data has been written
>> successfully would be to issue a read after every write.  That's not a
>> performance hit most applications are willing to take.  And, of course,
>> the media can still go bad at a later time, so it only guarantees the
>> data is accessible immediately after having been written.
>>
>> What I'm suggesting is that we should not complete a write successfully
>> if we know that the data will not be retrievable.  I wouldn't call this
>> adding an extra error model to contend with.  Applications should
>> already be checking for errors on write.
>>
>> Does that make sense? Are we talking past each other?
> 
> The badblock list is late to update in both directions, late to add
> entries that the scrub needs to find and late to delete entries that
> were inadvertently cleared by cache-line writes that did not first
> ingest the poison for a read-modify-write. So I see the above as being
> wishful in using the error list as the hard source of truth and
> unfortunate to up-level all sub-sector error entries into full
> PAGE_SIZE data offline events.

Sorry, don't mean to distract the discussion, but I'm wondering if
anyone has noticed SIGBUS with si_code = MCEERR_AO in a single process 
poison test over a dax-xfs file?  There is only 1 poison in the
file which has been consumed, it's the recovery code path (hole punch/
munmap/mmap/pwrite/read) that encounters the _AO. I'm confident that
latent error isn't the scenario per ARS scrub. Also, the _AO appears
rarely. This is un-explainable given the kernel MCE pmem handling
implementation.

> 
> I'm hoping we can find a way to make the error handling more fine
> grained over time, but for the current patch, managing the blast
> radius as PAGE_SIZE granularity at least matches the zero path with
> the write path.

Maybe the new filesystem op for clearing pmem poison should insist on
4K alignment? because in hwpoison_clear() the starting pfn is given
by PHYS_PFN which rounds down to the nearest page, so we might inadvertently
clear the poison bit and 'noce' bit from a page when we only cleared a
poison e.g. in the second half of the page.

BTW, set_mce_nospec() doesn't seem to work in 5.5 release,
   [ 2321.209382] Could not invalidate pfn=0x1850600 from 1:1 map
I will see if I can find more information.

> 
>>> Setting that aside we can start with just treating zeroing the same as
>>> the copy_from_iter() case and fail the I/O at the dax_direct_access()
>>> step.
>>
>> OK.
>>
>>> I'd rather have a separate op that filesystems can use to clear errors
>>> at block allocation time that can be enforced to have the correct
>>> alignment.
>>
>> So would file systems always call that routine instead of zeroing, or
>> would they first check to see if there are badblocks?
> 
> The proposal is that filesystems distinguish zeroing from free-block
> allocation/initialization such that the fsdax implementation directs
> initialization to a driver callback. This "initialization op" would
> take care to check for poison and clear it. All other dax paths would
> not consult the badblocks list.

thanks!
-jane


> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


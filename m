Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CA96E25FA06
	for <lists+dm-devel@lfdr.de>; Mon,  7 Sep 2020 13:59:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-Q_6J4peHMk23yZEEXNoHAw-1; Mon, 07 Sep 2020 07:59:55 -0400
X-MC-Unique: Q_6J4peHMk23yZEEXNoHAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D548B1006700;
	Mon,  7 Sep 2020 11:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9137842B;
	Mon,  7 Sep 2020 11:59:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92F7079FE9;
	Mon,  7 Sep 2020 11:59:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087Bx8cW008035 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 07:59:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCA818288C; Mon,  7 Sep 2020 11:59:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D76318288A
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 11:59:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC2CF800161
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 11:59:05 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-200-AaUx9qYlMMOM2NE7yE8jxA-1; Mon, 07 Sep 2020 07:59:03 -0400
X-MC-Unique: AaUx9qYlMMOM2NE7yE8jxA-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B7097260AB3B6CFA9599;
	Mon,  7 Sep 2020 19:58:59 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Sep 2020
	19:58:51 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<f8ec7113-a9da-46a0-16c8-1e245f9592f0@huawei.com>
	<20200904211109.GD11108@octiron.msp.redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <bd3eee2a-2918-c428-174a-2b7d9c05b6dc@huawei.com>
Date: Mon, 7 Sep 2020 19:58:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904211109.GD11108@octiron.msp.redhat.com>
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 08/14] libmultipath: donot free *dst if
 REALLOC fails in, merge_words
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi Ben:
  I think you are right. We should not keep them with partial information.
Thanks for your review.

-Lixiaokeng

On 2020/9/5 5:11, Benjamin Marzinski wrote:
> On Wed, Sep 02, 2020 at 03:20:29PM +0800, lixiaokeng wrote:
>> In merge_words func, if REALLOC() fails, the input *dst will
>> be freed. If so, mpp->hwhandler| mpp->features|mpp->selector
>> may be set to NULL after calling merge_words func in
>> disassemble_map func. This may cause accessing freed memory
>> problem.
>>
> 
> I'm not sure that this is the right way to fix the issue you're seeing.
> If merge_words() frees mpp->hwhandler| mpp->features|mpp->selector, it
> also sets them to NULL.  I don't see any place in disassemble_map()
> where these would be accessed if merge_words() freed them.  Even with
> this fix, there are still cases where disassemble_map() will return 1,
> with these members set to NULL. If there is something that is
> dereferencing them without checking if they're NULL, we should fix that.
> But simply making them include partial information doesn't seem like it
> fixes anything.
> 
> Am I missing something here?
> 
> -Ben
> 
>> Here, we donot free *dst if REALLOC() fails in merge_words func.
>>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
>> ---
>>  libmultipath/dmparser.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
>> index c1031616..482e9d0e 100644
>> --- a/libmultipath/dmparser.c
>> +++ b/libmultipath/dmparser.c
>> @@ -26,13 +26,12 @@ merge_words(char **dst, const char *word)
>>
>>  	dstlen = strlen(*dst);
>>  	len = dstlen + strlen(word) + 2;
>> -	*dst = REALLOC(*dst, len);
>> +	p = REALLOC(*dst, len);
>>
>> -	if (!*dst) {
>> -		free(p);
>> +	if (!p)
>>  		return 1;
>> -	}
>>
>> +	*dst = p;
>>  	p = *dst + dstlen;
>>  	*p = ' ';
>>  	++p;
>> -- 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


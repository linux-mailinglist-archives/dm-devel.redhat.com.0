Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 392CF25CF7A
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 04:51:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-SPyERapsM5eSg5TjApfx-w-1; Thu, 03 Sep 2020 22:51:07 -0400
X-MC-Unique: SPyERapsM5eSg5TjApfx-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F155C8027E1;
	Fri,  4 Sep 2020 02:51:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF4A45D9CC;
	Fri,  4 Sep 2020 02:50:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 112431826D2A;
	Fri,  4 Sep 2020 02:50:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0842n1Ls026447 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 22:49:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5400920244F7; Fri,  4 Sep 2020 02:49:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EA79200AF71
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 02:48:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FDCA80118B
	for <dm-devel@redhat.com>; Fri,  4 Sep 2020 02:48:58 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-IS5ee74UNHWZz_hHo3qCXg-1; Thu, 03 Sep 2020 22:48:55 -0400
X-MC-Unique: IS5ee74UNHWZz_hHo3qCXg-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 4701C5CA91A323259790;
	Fri,  4 Sep 2020 10:48:49 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Sep 2020
	10:48:40 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<b1baac25-58c2-8f27-67bd-5d050fcdf8c7@huawei.com>
	<e525938e5b810958512eb623898fd732bd8482c4.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <ef74857c-c81d-c0ec-4692-a9cd8299a99c@huawei.com>
Date: Fri, 4 Sep 2020 10:48:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e525938e5b810958512eb623898fd732bd8482c4.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 01/14] multipathd: return if
 dm_get_major_minor failed in, cli_add_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB



On 2020/9/4 1:26, Martin Wilck wrote:
> 
> Why not just quit the "do" loop in the error case
> for dm_get_major_minor()?
> 
> Martin

If dm_get_major failed at first time, it will be executed again
for some reason I don't know in the original code. Quiting the
"do" loop in the error case for dm_get_major_minor() is against
the twice attempt rule.

Lixiaokeng
> 
>>  		else {
>>  			sprintf(dev_path, "dm-%d", minor);
>>  			alias = dm_mapname(major, minor);
>> +			if (!alias)
>> +				condlog(2, "%s: mapname not found for
>> %d:%d",
>> +					param, major, minor);
>>  		}
>>  		/*if there is no mapname found, we first create the
>> device*/
>>  		if (!alias && !count) {
>> -			condlog(2, "%s: mapname not found for %d:%d",
>> -				param, major, minor);
>>  			get_refwwid(CMD_NONE, param, DEV_DEVMAP,
>>  				    vecs->pathvec, &refwwid);
>>  			if (refwwid) {
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


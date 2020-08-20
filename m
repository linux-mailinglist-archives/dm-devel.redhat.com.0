Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3CA24C0F9
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 16:52:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-HGnUkXCyPhaHmDpWM6TmvQ-1; Thu, 20 Aug 2020 10:52:51 -0400
X-MC-Unique: HGnUkXCyPhaHmDpWM6TmvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF50A425CB;
	Thu, 20 Aug 2020 14:52:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C0B60BF1;
	Thu, 20 Aug 2020 14:52:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41CB0183D020;
	Thu, 20 Aug 2020 14:52:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07KEq4La009294 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 10:52:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42001F100E; Thu, 20 Aug 2020 14:52:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C35F1000
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 14:51:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD32811E9C
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 14:51:59 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-567-fbP9k5KTOMW88GntzykN5w-1; Thu, 20 Aug 2020 10:51:55 -0400
X-MC-Unique: fbP9k5KTOMW88GntzykN5w-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 1AE2C6180752C8D6C65D;
	Thu, 20 Aug 2020 22:51:45 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 20 Aug 2020
	22:51:37 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<8fd64929-cb4b-5267-1899-15a82e2ff678@huawei.com>
	<fb04916036613edb59dfd470c449a1a199cd03ff.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <905553fd-8c51-2898-8015-3795c6affc9f@huawei.com>
Date: Thu, 20 Aug 2020 22:51:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb04916036613edb59dfd470c449a1a199cd03ff.camel@suse.com>
Content-Language: en-GB
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
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 3/5] multipathd: add reclear_pp_from_mpp in
	ev_remove_path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Martin:
   I test this in 0.8.4 without your patch series . I have review the
code with your patch series and I think this problem will be solved.
But I have another question.
ev_remove_path
	->__setup_multipath
		->update_multipath_strings
			->update_multipath_table
				->update_pathvec_from_dm
					->store_path
When multipathd del path xxx(such as sde) and multipath -v2 are
executed simultaneously, will the path(sde) deleted be stored to pathvec
again? In my opinion, sde is't delete in pathvec and in disassembel_map
sde will be stored to mpp->pg. When update_pathvec_from_dm, sde will be
stored again.

On 2020/8/19 0:36, Martin Wilck wrote:
> On Tue, 2020-08-18 at 21:08 +0800, lixiaokeng wrote:
>> Add reclear_pp_from_mpp in ev_remove_path to make sure that pp is
>> cleared in mpp.
>>
>> When multipathd del path xxx, multipathd -v2, multipathd add path xxx
>> and multipath -U
>> dm-x are executed simultaneously, multipath -U dm-x will case
>> coredump.
>>
>> The reason is that there are two paths with same dev_t in dm_table.
>> The process
>> is as follows:
> 
> Thanks for the report.
> 
> With which code have you tested this? I have reason to believe that 
> it would behave differently with my last patch series (in particular,
> part V "removed path handling") applied. I'm not sure if my series
> would fix the issue, but it would probably need a different fix.
> 
> Regards,
> Martin
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 03B2124FE9A
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 15:13:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-eVVen43XPSSw-bZEefE3Cg-1; Mon, 24 Aug 2020 09:13:34 -0400
X-MC-Unique: eVVen43XPSSw-bZEefE3Cg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760F1801AB5;
	Mon, 24 Aug 2020 13:13:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE76380923;
	Mon, 24 Aug 2020 13:13:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51710668F7;
	Mon, 24 Aug 2020 13:13:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07OD7lZU007263 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 09:07:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7C322166BA4; Mon, 24 Aug 2020 13:07:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D31E22166BA3
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 13:07:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F1BC901845
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 13:07:45 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-406-syf5bzirPUCJAw8NTju0hw-1; Mon, 24 Aug 2020 09:07:42 -0400
X-MC-Unique: syf5bzirPUCJAw8NTju0hw-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 57BC676E16F451520DEE;
	Mon, 24 Aug 2020 21:07:36 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
	21:07:28 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<8fd64929-cb4b-5267-1899-15a82e2ff678@huawei.com>
	<fb04916036613edb59dfd470c449a1a199cd03ff.camel@suse.com>
	<905553fd-8c51-2898-8015-3795c6affc9f@huawei.com>
	<352109cf9e0b3f1fbd1851e86bc12fef12c40dec.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <cb7990df-6c84-7fc9-78ef-bf4c8600010f@huawei.com>
Date: Mon, 24 Aug 2020 21:07:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <352109cf9e0b3f1fbd1851e86bc12fef12c40dec.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Martin:
  Thanks for your detailed explanation. I understand it  well.

Regards
Lixiaokeng

On 2020/8/20 23:22, Martin Wilck wrote:
> On Thu, 2020-08-20 at 22:51 +0800, lixiaokeng wrote:
>> Hi Martin:
>>    I test this in 0.8.4 without your patch series . I have review the
>> code with your patch series and I think this problem will be solved.
>> But I have another question.
>> ev_remove_path
>> 	->__setup_multipath
>> 		->update_multipath_strings
>> 			->update_multipath_table
>> 				->update_pathvec_from_dm
>> 					->store_path
>> When multipathd del path xxx(such as sde) and multipath -v2 are
>> executed simultaneously, will the path(sde) deleted be stored to
>> pathvec
>> again? In my opinion, sde is't delete in pathvec and in
>> disassembel_map
>> sde will be stored to mpp->pg. When update_pathvec_from_dm, sde will
>> be
>> stored again.
> 
> in ev_remove_path(), we set INIT_REMOVED state. That means this path
> won't be used in the RELOAD ioctl. If the ioctl is successful, it will
> be gone from the kernel (for the time being). Later, sync_map_state()
> will figure this out, and remove the path. If the parallel "multipath"
> command reloads the map after multipathd's RELOAD operation, and before
> update_multipath_table() called, re-adding the path, the path will be
> read back from the kernel, and sync_map_state() will not delete the it.
>>From multipathd's point of view it will remain in INIT_REMOVED state,
> though. multipathd will not try to reload the map again unless it's
> asked to do so with another "add path" or "del path" command. This
> results in an inconsistent internal state between multipathd and the
> kernel (multipathd considers the path as REMOVED even though it's still
> present in the map). I don't think this can be generally avoided if we
> allow multipath to make changes to kernel maps while multipathd is
> running. (*)
> 
> We could avoid this by delegating these commands from multipath to
> multipathd, as we already do for some other commands. "multipath"
> without any arguments would map to a "multipathd reconfigure" command,
> while "multipath $DEVICE" would be translated to "multipathd add map"
> or "multipathd add path".
> 
> Does this make sense?
> 
> Regards,
> Martin
> 
> (*) Well: we *could* try to analyze incoming uevents, and distinguish
> those that multipathd has initiated itself from other, externally-
> triggered ones. Then if an external event arrives, adding a path which
> we had previously removed, and this external event arrives after the
> remove event we initiated, we could in theory infer that an external
> program had reverted the change we just made. But this would result in
> complex and pretty fragile logic. I'm not sure if it's worth it. The
> "delegating" approach is safer and cleaner IMO.
> 
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


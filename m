Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 86499276BF4
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:31:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-9N9dxvCgMIa3eW9WMCAz_A-1; Thu, 24 Sep 2020 04:31:25 -0400
X-MC-Unique: 9N9dxvCgMIa3eW9WMCAz_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C2B11084C9B;
	Thu, 24 Sep 2020 08:31:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827FD100239F;
	Thu, 24 Sep 2020 08:31:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8E588C7A1;
	Thu, 24 Sep 2020 08:31:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O6sRkE003961 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 02:54:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 182392068533; Thu, 24 Sep 2020 06:54:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12CAE2166B27
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 06:54:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADA51800296
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 06:54:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-oln040092073062.outbound.protection.outlook.com [40.92.73.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-12-r5FqyCeuM7G5E7YNzDWgdw-1; Thu, 24 Sep 2020 02:54:20 -0400
X-MC-Unique: r5FqyCeuM7G5E7YNzDWgdw-1
Received: from VI1EUR04FT042.eop-eur04.prod.protection.outlook.com
	(2a01:111:e400:7e0e::50) by
	VI1EUR04HT004.eop-eur04.prod.protection.outlook.com
	(2a01:111:e400:7e0e::85) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21;
	Thu, 24 Sep 2020 06:54:18 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:7e0e::45) by VI1EUR04FT042.mail.protection.outlook.com
	(2a01:111:e400:7e0e::68) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via
	Frontend Transport; Thu, 24 Sep 2020 06:54:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D7F218B09ED1C9B136553E03E5A80BA16A58F266088B8523668C86308B3C9911;
	UpperCasedChecksum:29DDD362A321CB6FBC56402B96C6F1D461814F8160CFB6C7112401FFC013984A;
	SizeAsReceived:8208; Count:49
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.020;
	Thu, 24 Sep 2020 06:54:18 +0000
From: Frank Meinl <frank.meinl@live.de>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <AM0PR09MB289726B5423506E7A0CBFA47FE3B0@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<42aa1aaf935927e169e27e035fe307fd8181f9a6.camel@suse.com>
	<20200922222726.GC11108@octiron.msp.redhat.com>
	<df42a8a5ed7ecd27cc6d30a5561e1cc716d27033.camel@suse.com>
Message-ID: <AM0PR09MB289728167D421F64F6A60447FE390@AM0PR09MB2897.eurprd09.prod.outlook.com>
Date: Thu, 24 Sep 2020 08:54:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
In-Reply-To: <df42a8a5ed7ecd27cc6d30a5561e1cc716d27033.camel@suse.com>
X-ClientProxiedBy: AM4PR0501CA0061.eurprd05.prod.outlook.com
	(2603:10a6:200:68::29) To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <27ddb460-2fa0-55fb-6641-037c5fd5c2e2@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8070:a196:3b00:3d39:6008:782e:e7da]
	(2a02:8070:a196:3b00:3d39:6008:782e:e7da) by
	AM4PR0501CA0061.eurprd05.prod.outlook.com
	(2603:10a6:200:68::29) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.3412.20 via Frontend Transport;
	Thu, 24 Sep 2020 06:54:17 +0000
X-Microsoft-Original-Message-ID: <27ddb460-2fa0-55fb-6641-037c5fd5c2e2@live.de>
X-TMN: [7Pdyj6Km79zFDtuJUYQHdXT+2Lz3wJ1dgndzp3A1s2u38rijIw6mLLSCE8JGlw03MmmVJsrCBhw=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9cb4e1cc-ff84-4de8-2dfb-08d86056a81c
X-MS-TrafficTypeDiagnostic: VI1EUR04HT004:
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Ed1gF+q2X14cyoOPyPEQuF2xEj+rJehIT1lbD3TJ0Z67yCy5tWfpVkmaF55Ghmg8XG1uOFetptEIqr2yNdW/+QOOt9BLqWRj8usqcsVtoKw8hjzkBhNUKK1/rrKKfkGfB2HW9EoKVOG8TDIX0nZRx8Oq0OQtOAkjsdIIk7hChFNQvpMw+/GBxMZFGY72yqbQJJXYa9RSSAEjlmBW8Ef48w==
X-MS-Exchange-AntiSpam-MessageData: P6lsMtMd86wPo2Qtt15DOnd6s8HfMtgN/59flMowQAV01lDaXNar6cXZbuxdMMPdXX2lxV6iVzaU3ABWNIgsKLClzdRn0wTx+yWXLvWrvYxyePP0rnpfh33W6sOWvtyTUCQCxyyg8C+6qaQsyFoq8dqO6y/TdkEDrba2i9xdhVGuixsqdrOijYq8CtfevJzqBZSs/qfgLaBganCsWrWZDg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb4e1cc-ff84-4de8-2dfb-08d86056a81c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 06:54:18.1725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT042.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT004
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 04:31:06 -0400
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: Allow discovery of USB devices
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

thank you all for your replies.
And of course good to hear that you are also open for this rather 
special use case ;)

I will then revise the patch as you suggested, and send it again for review.

   Frank

On 23.09.20 00:34, Martin Wilck wrote:
> On Tue, 2020-09-22 at 17:27 -0500, Benjamin Marzinski wrote:
>> On Tue, Sep 22, 2020 at 09:59:36PM +0200, Martin Wilck wrote:
>>> On Tue, 2020-09-22 at 20:34 +0200, Frank Meinl wrote:
>>>> This change adds a new configuration option allow_usb_devices. It
>>>> is
>>>> disabled by default, so that the behavior of existing setups is
>>>> not
>>>> changed. If enabled (via multipath.conf), USB devices will be
>>>> found
>>>> during device discovery and can be used for multipath setups.
>>>>
>>>> Without this option, multipath currently ignores all USB drives,
>>>> which
>>>> is convenient for most users. (refer also to commit 51957eb)
>>>>
>>>> However, it can be beneficial to use the multipath dm-module even
>>>> if
>>>> there is only a single path to an USB attached storage. In
>>>> combination
>>>> with the option 'queue_if_no_path', such a setup survives a
>>>> temporary
>>>> device disconnect without any severe consequences for the running
>>>> applications. All I/O is queued until the device reappears.
>>>
>>> Hm. So you want to use multipath just to enable queueing?
>>> I wonder if that can't be achieved some other way; multipath seems
>>> to
>>> be quite big hammer for this nail. Anyway, I don't think this would
>>> hurt us, so I don't have good reasons to reject it.
>>>
>>> Waiting for others' opinions.
>>
>> I've actually seen other cases where people are using multipath on
>> single path devices just for the queuing, and when I thought about
>> it, I
>> realized that it makes sense. Multipath works with devices as they
>> are,
>> instead of needing special metadata, like lvm devices. People often
>> realize that they need this after the device is already set up. Plus,
>> multipath already deals with devices that have partitions or logical
>> volumes on top of them. It's also easy to configure exactly how you
>> want
>> queueing to work. This use case might be a small nail, but it is a
>> nail,
>> and multipath is a reasonable tool to get the job done.
>>
>> It doesn't seem too hard to write a dm target that would queue and
>> retry
>> IO at some configurable interval, for some configurable number of
>> times,
>> when it failed. But you would also need to copy the work for getting
>> the
>> device, and any partitons on it, to autoassemble after the frist time
>> it's set up and to make sure other layers use this device instead of
>> the
>> underlying device. Or, people can just use multipath.
> 
> Ok. So Frank, please just clarify the remaining minor points. You may
> actually want to put (a short version of) this motivation in the man
> page.
> 
> Regards,
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 12E7B277D6A
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 03:10:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-SXydvhZdOFiyfXFkOTzwtg-1; Thu, 24 Sep 2020 21:10:17 -0400
X-MC-Unique: SXydvhZdOFiyfXFkOTzwtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 225B91074671;
	Fri, 25 Sep 2020 01:10:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8196A5578A;
	Fri, 25 Sep 2020 01:10:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BFE144A77;
	Fri, 25 Sep 2020 01:10:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P1A4jc010747 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 21:10:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 771E21009A1F; Fri, 25 Sep 2020 01:10:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 701241009B91
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 01:10:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE4A4101A540
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 01:10:01 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-EpmLjWhdNNaZgxn2QIhtHg-1; Thu, 24 Sep 2020 21:09:57 -0400
X-MC-Unique: EpmLjWhdNNaZgxn2QIhtHg-1
IronPort-SDR: f8HfRkdu2Cdb31dZRtCgSie/7TD6LYI1QLa9Lo6NwV33y38/TGlBkNfZPirj59E6vd9jJc1PBP
	olLKCenpbuYzbRsbXS4UhXNFXItVstmFnSXGKfqDrMC8MnEKPjASjSC40X1EeB7JENQizS7EUW
	T34qhmJZ77ggY9nmu7HRUklsCfBig8VsANZscr7XYoUyujmtJS6uguh7UXTUoWU0CyRRI592Bv
	DbzPCxqBo+aZWMW1PTTy2nTIKzplzen1zwCbAaWRWoBdr4JuHWu38ziub1PJfArBmri6TnaNSz
	PSk=
X-IronPort-AV: E=Sophos;i="5.77,300,1596470400"; d="scan'208";a="148251941"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
	by ob1.hgst.iphmx.com with ESMTP; 25 Sep 2020 09:09:56 +0800
Received: from MWHPR04MB3758.namprd04.prod.outlook.com (2603:10b6:300:fb::8)
	by MWHPR04MB1041.namprd04.prod.outlook.com (2603:10b6:301:44::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.21;
	Fri, 25 Sep 2020 01:09:53 +0000
Received: from MWHPR04MB3758.namprd04.prod.outlook.com
	([fe80::30a6:9f87:e223:6468]) by
	MWHPR04MB3758.namprd04.prod.outlook.com
	([fe80::30a6:9f87:e223:6468%6]) with mapi id 15.20.3412.021;
	Fri, 25 Sep 2020 01:09:52 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>, Mikulas
	Patocka <mpatocka@redhat.com>
Thread-Topic: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
	lengths for skcipher devices
Thread-Index: AQHWkhHp94cMgzL5U0inTZyZNaZrAw==
Date: Fri, 25 Sep 2020 01:09:52 +0000
Message-ID: <MWHPR04MB37588DF8C3FFF4BD0C3CD543E7360@MWHPR04MB3758.namprd04.prod.outlook.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
	<alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
	<alpine.LRH.2.02.2009241345370.4229@file01.intranet.prod.int.rdu2.redhat.com>
	<fd512a7d-c064-4812-a794-5274c10687db@default>
	<alpine.LRH.2.02.2009241421170.8544@file01.intranet.prod.int.rdu2.redhat.com>
	<eb43742e-bdfe-4567-8240-1d8e083d76a2@default>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:61d4:c443:7ba:718]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f6a519bd-28dd-4585-d7a1-08d860efb569
x-ms-traffictypediagnostic: MWHPR04MB1041:
x-microsoft-antispam-prvs: <MWHPR04MB1041ECA4023653401EE9158DE7360@MWHPR04MB1041.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: IpwEbxjjRxpdsRCv9eCfIZQ5xVpBGv9VLzDlftpVf0jDKoGgW73RAwpUqj7SlJ32j3P4TgZDT+TCbZoJhVmIJcjTIiq3kjE0cNrh8C5ARCks538zINUnGkbXnYl3h9xC0ZZol46Gf4FSwxP7f1QadiECSPImxo1s/IgohXzNAoocm6MD9r9fAmZw+8eUlgfXMkqlKUmK9F+apn7ZIqFOEy5n41REJjPCZ5S0bVsMRTAOKj/b4rxsdSH0r9cl/6OlKa1XhM4/YaVcgtvIpWdyVGCgMYkHjWFy6duY14B38Db/jE9AkDPaOHs/gkA4TEXWai+vw0Q0lKy0K2B5LhzyUNaLi4dAJdBF9qVKs+I5Lg/vxtm0Iip/2sU75YQn4CGYQuMv5bRXQqqJFos7QtO2Ig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR04MB3758.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(55016002)(2906002)(7416002)(8936002)(4326008)(7696005)(316002)(110136005)(83380400001)(9686003)(478600001)(52536014)(5660300002)(76116006)(66556008)(966005)(66946007)(86362001)(66446008)(8676002)(53546011)(6506007)(66476007)(64756008)(71200400001)(186003)(33656002)(54906003)(91956017);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: o3TUgsEnWPFLJiGgPcQ3JfpS4tQOKKXmFm9ItiVtbGUKNffxhpX87ewBeGo/W9+yTeEz0+KOLOC7L8eHU0Y20lvkaGasJNAc7vCpATWw3lYuN1k3bz3PXIIpYQmI26a7FyKwdxHNaJGcEA1T27GMJ2CDINzijkPr61WLBobMi6E+DxhbMD7lw/lmNwD/j07wKRTLz9eJ3t76bllfWruT5dVmpyvR9+ER0OJMSFI1UPGEVP4rE6cTJlfwXnmlmdW57jwGXPnyOQbdPBjM83SgzyGN9ctq/a6EADXIT1kg8yEgW0V3iDyAukGaOABw3T9VA8hTg70DKt3OqN4J9ItB3KCpRHIMaOSAg7vn5yxRttj9euOI1qgKScuG9sFv/dvHpBBbzEigYcVEb+B51XoE1LpDiiRtFdBSSYyha1ynWO+97mGsv5QmILPNIcGjXR0+HdBSOngI8pbIz3N0t+GRcA0r984GNm5vi4DuhRaCNQoMj2tXbpJ5KO0ifpWJI0/DqxPULDXHKCXOXc0n4/414HcPZKMbXYNfhfpK1tl9sH7WwH/kwpqS1pFa6JFseZexdxWHdGfC9U2EVYz9n9nTDk8qqwmUn7NobvmaPb34dVAsJXGJVcGTej0pFlNk0Ct14XsZLBhWT+SnO7uggASgJgaS/L57nVURYgzgUszL3TIZpijiD38H5OYMpAjYNTfVT4N+D76mSFkuniaItoAdYg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR04MB3758.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a519bd-28dd-4585-d7a1-08d860efb569
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 01:09:52.9518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1MpRZA5eVPnHxpJWuWYI3a20yRxlyQjmAHwciMVE/8YPyoJqtGwgD6tt1TRpPcJ3DdsoB1XG8NFaQeHqD1iaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1041
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08P1A4jc010747
X-loop: dm-devel@redhat.com
Cc: "ssudhakarp@gmail.com" <ssudhakarp@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, "dm-crypt@saout.de" <dm-crypt@saout.de>,
	Eric Biggers <ebiggers@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, Ma <shirley.ma@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>, Shirley,
	Milan Broz <gmazyland@gmail.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/09/25 4:14, Sudhakar Panneerselvam wrote:
>>
>> On Thu, 24 Sep 2020, Sudhakar Panneerselvam wrote:
>>
>>>> By copying it to a temporary aligned buffer and issuing I/O on this
>>>> buffer.
>>>
>>> I don't like this idea. Because, you need to allocate additional pages
>>> for the entire I/O size(for the misaligned case, if you think through
>>
>> You can break the I/O to smaller pieces. You can use mempool for
>> pre-allocation of the pages.
> 
> Assuming we do this, how is this code simpler(based on your
> comment below) than the fix in dm-crypt? In fact, this approach 
> would make the code change look bad in vhost, at the same time
> having performance penalty. By doing this, we are just moving the 
> responsibility to other unrelated component.

Because vhost is at the top of the block-io food chain. Fixing the unaligned
segments there will ensure that it does not matter what device is under it. It
will work.

I am still baffled that the unaligned segments go through in the first place...
Do we have something missing in the BIO code ?

> 
>>
>>> carefully, you will know why we have to allocate a temporary buffer that
>>> is as big as the original IO) and on top of it, copying the buffer from
>>> original to temporary buffer which is all unnecessary while it can
>>> simply be fixed in dm-crypt without any of these additional overheads.
>>>
>>>>
>>>>> Only other
>>>>> possibility I see is to have windows fix it by always sending 512 byte
>>>>> aligned buffer lengths, but going with my earlier point that every other
>>>>> component in the Linux IO path handles this case well except for
>>>>> dm-crypt, so it make more sense to fix it in dm-crypt.
>>>>>
>>>>> Thanks
>>>>> Sudhakar
>>>>
>>>> Are you sure that the problem is only with dm-crypt? You haven't tried
>> all
>>>> the existing block device drivers, have you?
>>>
>>> My question is, why dm-crypt worries about alignment requirement of
>>> other layers? Is there anything that impacts dm-crypt if the segment
>>> lengths are not aligned?(I believe this case is just not handled so far
>>
>> Because the code is simpler if it assumes aligned buffers.
> 
> Did you get a chance to review my changes? If you want more documentation,
> improve the code, etc, let me know, I can do that if there is scope for that.
> 
>>
>>> in dm-crypt and my patch addresses it). Should dm-crypt not just pass on
>>> all those I/O requests to those respective layers to handle it which
>>> will be more graceful?
>>>
>>> -Sudhakar
>>
>> So, suppose that we change dm-crypt to handle your workload - what are
>> you
>> going to do with other block device drivers that assume aligned bio vector
>> length? How will you find all the other drivers that need to be changed?
>>
>> You are claiming that "every other component in the Linux IO path handles
>> this case well except for dm-crypt", but this claim is wrong. There are
>> other driver that don't handle misaligned length as well.
> 
> I should not have said, "every other component", I take that back, sorry. How
> about doing something like this in crypt_convert_block_skcipher():
> 
> Add a check that looks at the alignment requirement of the low-level driver
> and reject the I/O if it doesn't meet that requirement. This means, we still
> need to handle the case in this function where the low lever driver support
> unaligned buffer lengths, that means, my other changes in this function
> would still be needed.
> 
> Is this acceptable to everyone?
> 
> -Sudhakar
> 
>>
>> Mikulas
>>
>> --
>> dm-devel mailing list
>> dm-devel@redhat.com
>> https://www.redhat.com/mailman/listinfo/dm-devel
>>
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


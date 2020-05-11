Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A4B1B1CD446
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589187143;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nbGdvnXm03fKnxkOU2qfPnmKz9ohpyEBb7CloUvFa7o=;
	b=V7f255T99kqSKZs64XLvnhlJvKZ8EXf+dc2XdrH3v5qvGTvaNAuQAPrUAukJoi67nm17oo
	0qo6e4Bw4UpcbMQZpaHekdEKeKDQwfHlFS783ZLexWpFhYg4opWo7FU6JwVTPBh7/tp2Ac
	Ku9AVyP1akgRBKykFYMC6fRmTHEQ09s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-k7yzXLQcN3y0jHCiA14SZw-1; Mon, 11 May 2020 04:52:21 -0400
X-MC-Unique: k7yzXLQcN3y0jHCiA14SZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 939CF801503;
	Mon, 11 May 2020 08:52:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17BF15D9E2;
	Mon, 11 May 2020 08:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A79F1809543;
	Mon, 11 May 2020 08:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8q36D002048 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:52:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 376E7D0197; Mon, 11 May 2020 08:52:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B23D19B6
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:51:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5E6B1049881
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:51:58 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-365-FqV18RK3NCKs71G6cUPw9g-1; Mon, 11 May 2020 04:51:54 -0400
X-MC-Unique: FqV18RK3NCKs71G6cUPw9g-1
IronPort-SDR: h2be5W3k05H0rpXEvujAUHSzoPzd8f2Or8KvOcXq8qOw4B9Fwqw5shRhRwIyrQQCYcDombSsfQ
	6GXLeifj/uF0fbh0EyWsXTDkzO2e0jiXE/cMRNNrx7On7a8kF6z64H+nqQQvTg5iLyjBZlgNz8
	0xb9O7dmZSjct2flOhII4yIOGHIEI1Mt9MAOIOUWcQzwX/4yAz5CpONeHcOJtZdZsLPqA3X72D
	aZaRDLJE3WXFaINYkxDOnDxyY/OmGZVCapJBEqdfOktcn1Rdc5D3fwvQGeuPNM5HgK5J5W7JNq
	eCU=
X-IronPort-AV: E=Sophos;i="5.73,379,1583164800"; d="scan'208";a="138821544"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 16:51:52 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6536.namprd04.prod.outlook.com (2603:10b6:a03:1c6::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34;
	Mon, 11 May 2020 08:51:50 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 08:51:50 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 15/15] dm-zoned: metadata version 2
Thread-Index: AQHWJ22lcTwtwhdDzUiQksK61WmZkQ==
Date: Mon, 11 May 2020 08:51:49 +0000
Message-ID: <BY5PR04MB6900D34837D615DB2C1EB80FE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200511082430.39455-1-hare@suse.de>
	<20200511082430.39455-16-hare@suse.de>
	<BY5PR04MB69008424543BE9E497BBEE9DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<0601428c-8c71-06a9-07b9-d7b1b6331c70@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d011358-217e-444e-7caf-08d7f5888b77
x-ms-traffictypediagnostic: BY5PR04MB6536:
x-microsoft-antispam-prvs: <BY5PR04MB6536507A06910E8D9A66C928E7A10@BY5PR04MB6536.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xUPXToCsyy/87RKirdZ/eNjyj6eyBmAcN7FgwUqPXQBg6okd0L5Dl9zyD8DQcYt/7rGhaIViwfGMM6B1Xxw21FANTPdSHmDMd5DnTKfW1W/k7mZCgms5ECmr6JFiw5lMsIzxK+PnrVjAmitBU5p2G2HlDbqHnqeozeWUpnE3ARhSBT896ceVmVXs1fRlhRUtJWeMG+AZ/Xn1H6Yp8ukA/s3WQOj1V6OrHcLrtkHZGbkiR6mioQZgwqz1sljQD0SY9jxvR1CYhWhMZ1FqkJpSBKBxOgN5kUf9vXIVkbiWRjT9axeC+ZavsbkN6/sWgFeWJHsDcFcLY9L3sYhEZnvE5XgOCGOEGyRxu+m5g6LpBq6ENnYAE+OGGs+1Cqx/SREpJqB3fKuy4hkyjIECcJaiS5VnS0I76pnFGSXCtMMj8HHvzkTJ0gVpX8ezmCgLW2yxR1Jk1fdmoTrQuOa44Qa68fAqPXqWllaQn1YJ/dYde7xsd+/AQeEZ5k+w/lqqGox3uGYXBeS0MCzpnpmDakS8OQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(33430700001)(110136005)(2906002)(8676002)(54906003)(66946007)(316002)(66556008)(52536014)(66476007)(66446008)(26005)(186003)(6506007)(53546011)(76116006)(64756008)(8936002)(7696005)(33440700001)(55016002)(9686003)(86362001)(478600001)(33656002)(4326008)(5660300002)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: uaKDZoUiNxglD3wwdZNLLVbE4CYB2WVEWnz2gbfmspyEfM5C8+cDoi75DxBzEh/qWuMez/nov9geDbNzqMltzIkZu35ZnyDbEIxYkRJ8u7+ow+eroqhddBruBKC7aME4120IsSZZmQekkbtChiVplPzjdEdHs2j8S50v3VX6bDMdHidx8aocYHqEPIPsvfGPsinV/6j+xll5KuP9E20x1IAwhKWQ4LN0xEDDXuv7Nd5Au72joFbPpKi4dTUsS/vXIgFzVHc1x/zDgnJbMubJXRHuiDuP3YoGKhgQFjAStx9iStJeBM45H/68+1l2NbV0Y0wbWYD8KWJjJlgByDQBJ+vnWN+u1Qp2AHKG/JU8wNBg9oY1+YtIhiqGjn8+OJxRLC2pZdgK1vmq7bxMFml6wKuWlv7eA+d/72kgMPmt3m9mjW/W9wGOtYATrBxx3ZHLAn4Cvb5wRtIVHKbTygRT16cT/aWe/IH09tTFr/Gqab76sgzNkpKxsNmn/ykMVH9j
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d011358-217e-444e-7caf-08d7f5888b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 08:51:49.9201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UO/02YmUTX+a9RxGIZMRunWE0mg/FvdS5jZwa/OKN0CX2m66U1ntNT15lj23WXIO9m16A1BhANDfC6jBq+EQHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6536
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B8q36D002048
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] dm-zoned: metadata version 2
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/11 17:46, Hannes Reinecke wrote:
> On 5/11/20 10:36 AM, Damien Le Moal wrote:
>> On 2020/05/11 17:24, Hannes Reinecke wrote:
>>> Implement handling for metadata version 2. The new metadata adds
>>> a label and UUID for the device mapper device, and additional UUID
>>> for the underlying block devices.
>>> It also allows for an additional regular drive to be used for
>>> emulating random access zones. The emulated zones will be placed
>>> logically in front of the zones from the zoned block device, causing
>>> the superblocks and metadata to be stored on that device.
>>> The first zone of the original zoned device will be used to hold
>>> another, tertiary copy of the metadata; this copy carries a
>>> generation number of 0 and is never updated; it's just used
>>> for identification.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> Reviewed-by: Bob Liu <bob.liu@oracle.com>
>>> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
>>
>> Forgot to read through the documentation update. A couple of comments added below.
>>
>>> ---
>>>   .../admin-guide/device-mapper/dm-zoned.rst         |  34 ++-
>>>   drivers/md/dm-zoned-metadata.c                     | 310 +++++++++++++++++----
>>>   drivers/md/dm-zoned-target.c                       | 185 ++++++++----
>>>   drivers/md/dm-zoned.h                              |   7 +-
>>>   4 files changed, 427 insertions(+), 109 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
>>> index 7547ce635161..553752ea2521 100644
>>> --- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
>>> +++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
>>> @@ -37,9 +37,13 @@ Algorithm
>>>   dm-zoned implements an on-disk buffering scheme to handle non-sequential
>>>   write accesses to the sequential zones of a zoned block device.
>>>   Conventional zones are used for caching as well as for storing internal
>>> -metadata.
>>> +metadata. It can also use a regular block device together with the zoned
>>> +block device; in that case the regular block device will be split logically
>>> +in zones with the same size as the zoned block device. These zones will be
>>> +placed in front of the zones from the zoned block device and will be handled
>>> +just like conventional zones.
>>>   
>>> -The zones of the device are separated into 2 types:
>>> +The zones of the device(s) are separated into 2 types:
>>>   
>>>   1) Metadata zones: these are conventional zones used to store metadata.
>>>   Metadata zones are not reported as useable capacity to the user.
>>> @@ -127,6 +131,13 @@ resumed. Flushing metadata thus only temporarily delays write and
>>>   discard requests. Read requests can be processed concurrently while
>>>   metadata flush is being executed.
>>>   
>>> +If a regular device is used in conjunction with the zoned block device,
>>> +a third set of metadata (without the zone bitmaps) is written to the
>>> +start of the zoned block device. This metadata has a generation counter of
>>> +'0' and will never be updated during normal operation; it just serves for
>>> +identification purposes. The first and second copy of the metadata
>>> +are located at the start of the regular block device.
>>> +
>>>   Usage
>>>   =====
>>>   
>>> @@ -138,12 +149,21 @@ Ex::
>>>   
>>>   	dmzadm --format /dev/sdxx
>>>   
>>> -For a formatted device, the target can be created normally with the
>>> -dmsetup utility. The only parameter that dm-zoned requires is the
>>> -underlying zoned block device name. Ex::
>>>   
>>> -	echo "0 `blockdev --getsize ${dev}` zoned ${dev}" | \
>>> -	dmsetup create dmz-`basename ${dev}`
>>> +If two drives are to be used, both devices must be specified, with the
>>> +regular block device as the first device.
>>
>> Actually, the zoned block device must be first. Otherwise dmzadm complains. We
>> can change that, or change the doc. Which do you prefer ? No strong opinion here.
>>
> Nope, not any more. Fixed it in my local repo (which I haven't pushed, 
> sorry).
> 
> But after the last discussion we had I thought it better and more 
> consistent to have the regular device first, just like the device-mapper 
> interface.

Works for me !

> 
>>> +
>>> +Ex::
>>> +
>>> +	dmzadm --format /dev/sdxx /dev/sdyy
>>> +
>>> +
>>> +Fomatted device(s) can be started with the dmzadm utility, too.:
>>> +
>>> +Ex::
>>> +
>>> +	dmzadm --start /dev/sdxx /dev/sdyy
>>
>> And same here, the zoned device must come first. I added a patch that internally
>> reverse that order for the dm start operation so that the regular device is
>> specified first.
>>
> See above. I've fixed up dmzadm for this.
> 
> I just hadn't pushed the patch as I wanted to get the kernel bits 
> settled. But now that we have I'll be pushing the dm-zoned-tools updates.

Please send changes on top of the "staging" branch. Your first batch of changes
is already merged in that branch.

> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


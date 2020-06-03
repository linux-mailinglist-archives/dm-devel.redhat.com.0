Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 785E51EC671
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 03:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591146714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0HMkMp7/xUXQ8BiD4tvdIOu8uF1nD0QJIDzt3k+tjdc=;
	b=G2AQ55/wc1L9Emqt3lxTYjRJNP65tWx6jeuSWrTY0EPDRyYjkuY9VotvTkHs69j685K0IR
	9GmTFY6MkSzSEMACd7SH6Z/pFRE+pBy7p97JdQDfADoMF3wec0Wp8OFjnUbTImZ8d5Pdcf
	sLyajGk9anw35hvESfA0BZKSxePcjYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-Xx562EOZNjKRU-tlEFeF6Q-1; Tue, 02 Jun 2020 21:11:52 -0400
X-MC-Unique: Xx562EOZNjKRU-tlEFeF6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E82107ACCA;
	Wed,  3 Jun 2020 01:11:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5EF05D9CC;
	Wed,  3 Jun 2020 01:11:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AD5F6B57F;
	Wed,  3 Jun 2020 01:11:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0531BDc5000904 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 21:11:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B390C2026E1C; Wed,  3 Jun 2020 01:11:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE67F2026D67
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 01:11:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB8ED86CB8E
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 01:11:09 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-AC57dmA_Pz2ha_yRFvPbPw-1; Tue, 02 Jun 2020 21:11:05 -0400
X-MC-Unique: AC57dmA_Pz2ha_yRFvPbPw-1
IronPort-SDR: 6RmD0nTPordJ6PxNZU0/LNo4DAw+0x3bKcjwrXj6e6wqr+sjgNzvtTPmqGcs1rBBUmnCpeC7W4
	qHsWLrXdvrIoOP8PdXtsTIjoiWQamakfd2A/ZKZwYusyF363oZ4QYuahRwEUs9JzVnY6NAgdse
	tQWQuY+4ECC/LZ0+POJQ2cGz9QvG0nirDobfkht0TyNlWTpLfct7WqsuyvYgOTkHjF2q2ICVFw
	fdsf8ODWUHjm3pU9DNk1OjfjlYLXHqDPY4LI9W9LzLohG2+TS/TR2+azex2rd7FJAJkOxIkDoV
	Z2I=
X-IronPort-AV: E=Sophos;i="5.73,466,1583164800"; d="scan'208";a="241931362"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
	by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2020 09:11:20 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0918.namprd04.prod.outlook.com (2603:10b6:910:54::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18;
	Wed, 3 Jun 2020 01:11:01 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.024;
	Wed, 3 Jun 2020 01:11:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>, Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCHv4 00/15] dm-zoned: multiple drive support
Thread-Index: AQHWOM5fjVkrl/BBnU6CAN4Dqq3Pgw==
Date: Wed, 3 Jun 2020 01:11:01 +0000
Message-ID: <CY4PR04MB37519AA086D8ADDFC7003CFFE7880@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200602110956.121170-1-hare@suse.de>
	<20200602222719.GA14318@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6ecc4d8-50d4-4c79-8756-08d8075afb39
x-ms-traffictypediagnostic: CY4PR04MB0918:
x-microsoft-antispam-prvs: <CY4PR04MB0918B4B6839ABCFBAF234E89E7880@CY4PR04MB0918.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9rd8PNMHCWI9Vk59cKMSnf35Emx9oxdaehbCQCYIt9F2/wcrgG6ASFwWLrVbWNBHTd1o9TdQM1JRD4mh+1hKqjz8MxsCLYKpj3TR/zxCA+LCKYfnl94VViF50dwONukIXxjRisifqECXoOJGIhnXVFmXBuDVIxEPK71qBwoV4fMflKRUjLWYF81T8oqL2pZjXE9aR43EGxsqMUD9woMK6IenGUibct4fLMxecKpoIgzpRconzjNlHrDZ6ZTdsrFQybWzMOXeZ7DhuEXNTkpWxtgdMmFq74cPh+CirD7MQ8G9q3vnqLDxwNYZC5KhuA1jBJ6CEr5p+a8Vfme8OTuE1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(8676002)(8936002)(316002)(7696005)(6506007)(53546011)(66446008)(4326008)(71200400001)(64756008)(52536014)(5660300002)(55016002)(33656002)(86362001)(66556008)(66476007)(76116006)(91956017)(66946007)(83380400001)(9686003)(2906002)(186003)(26005)(478600001)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: OTQpAnfKgeqjVUy58ICHfVDjVWTLHoZR1EBRIPWoCic0izFSnYSf71OV0zulouITHxn2um+uJafsN9CSI7mSKTPKwu/xts5JMP53znMQHkUb8RYsfnhuAFzxRkfZHdthNgUhp5Fj9knCwotGT2SPOmip/j9j3bjnuwgWskWuoB/5FJauzt28JXqSicD2Q+pcwITgbpMVnSc3ufcrTpucj+7bMVOrEoo2Jh3Hyoe4z8Y9KO1hKjMyCO+yxBPXUQiK9RLZ/z7E5U4dihS4iL4+fF35e9jbLNQG+wd3l4EqXI0vR5zkI1fB0UXtFIdv3CAZs6ucC7VlUYl5YUf0VLpCDH8gfu7mfMsGagSnV/pLD7Y2iUI7Fx1IvvShX55iIZ7COXFXZAx3gMfDMjEZtB7+4hJXZGPDEQ90CKHKa41rfmOlKQEdYagLmqcZiwi9//r7YpII9W/aZgHZXilq/8+Rc6Hf2wg8ktjeupO9IDAKmr297AhZiJfhPOOeEckcZZL4
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ecc4d8-50d4-4c79-8756-08d8075afb39
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 01:11:01.4728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wz//hu4clzkjZyL6Wy232XkiOvYIFfDeuZ2J0wjcudtFeeXmrbQKh/skHkFO3+OvcmdSIDS0hLdLrCgO0b0Zxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0918
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0531BDc5000904
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv4 00/15] dm-zoned: multiple drive support
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

On 2020/06/03 7:27, Mike Snitzer wrote:
> On Tue, Jun 02 2020 at  7:09am -0400,
> Hannes Reinecke <hare@suse.de> wrote:
> 
>> Hi all,
>>
>> here's the second version of my patchset to support multiple zoned
>> drives with dm-zoned.
>> This patchset:
>> - Converts the zone array to using xarray for better scalability
>> - Separates out shared structures into per-device structure
>> - Enforce drive-locality for allocating and reclaiming zones
>> - Lifts the restriction of 2 devices to handle an arbitrary number
>>   of drives.
>>
>> This gives me a near-perfect scalability by increasing the write
>> speed from 150MB/s (for a cache and one zoned drive) to 300MB/s
>> (for a cache and two zoned drives).
>>
>> Changes to v1:
>> - Include reviews from Damien
>> - Reshuffle patches
>> Changes to v2:
>> - Add reviews from Damien
>> - Merge patches 'dynamic device allocation' and
>>   'support arbitrary number of devices'
>> - Fix memory leak when reading tertiary superblocks
>> Changes to v3:
>> - Add reviews from Damien
>> - Add patch to ensure correct device ordering
> 
> I've picked this series up for 5.8 (yes, I know it is last minute).  But
> I saw no benefit to merging the initial 2 device step in 5.8 only to
> then churn the code and interface to support an arbitrary number of
> devices in 5.9.  Easier to support one major update to the code now.
> 
> As such the target's version number was _not_ bumped from 2.0.0 to
> 3.0.0.
> 
> I tweaked various patch headers (_please_ "dm zoned" instead of
> "dm-zoned" in commit subjects, also don't ever say "we" or "this patch"
> in a commit header... if you do, I am forced to rewrite the header).
> 
> BTW, just so I feel like I said it: all these changes to use additional
> device(s) really seems like a tradeoff between performance and reduced
> MTBF -- there is increased potential for failure with each additional
> device that is added to the dm-zoned device... there I've said it ;)

Yes, agreed. While the cache SSD + 1xSMR disk can I think have reasonable
applications, more than 1 SMR disk without any data protection is indeed
dangerous. However, I think that we now have a good base to improve this:
duplication of zones across devices using reclaim should not be difficult to
implement. That is a RAID1 level, to which we can even add more than one copy
again with reclaim (dm-kcopyd comes in very handy for that). And I am still
thinking of ways to erasure code zones across the multiple devices to raise the
possible RAID levels :)

Another approach would be to do intelligent stacking of dm-raid on top of
dm-zoned devices. "intelligent" here means that in case of any drive failure,
only a partial rebuild of the dm-zoned device with the failed drive is needed:
one only needs to rebuild the sector chunks that the failed SMR drive was holding.

> 
> Thanks,
> Mike
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


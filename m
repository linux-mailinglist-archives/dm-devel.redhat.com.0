Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ED8BA1CD80B
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 13:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589196326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZbUOZW/5Z3X2xs5myzQtA+F9s0Xapnsd3wy9naIJS8s=;
	b=Rx29IGOt0yIMd4qzemJrar3k1UInzI6TcrKvP0x3Uk3KE0pVWk/vvhlLrz83jXPC/5e1no
	8ce89vfAld8jb2RnhcaWmv/ub26I68IvItcpdoIK2sDsIGxHTTTgj2rf7mtn+Hzsa2E3xV
	jAQbuNC+WS4BADp+bnp1XiXqMnK9bYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-qZX3ZDQzMGK5uGT4tVzZ2Q-1; Mon, 11 May 2020 07:25:24 -0400
X-MC-Unique: qZX3ZDQzMGK5uGT4tVzZ2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ABD61899527;
	Mon, 11 May 2020 11:25:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7337526E;
	Mon, 11 May 2020 11:25:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 724D31809543;
	Mon, 11 May 2020 11:25:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BBPBfn018540 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 07:25:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FE0B2166BA0; Mon, 11 May 2020 11:25:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B37F2166B28
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:25:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71ED8833B45
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:25:09 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-239-YP1dbNzFMvKc-yGsrygQFA-1; Mon, 11 May 2020 07:25:05 -0400
X-MC-Unique: YP1dbNzFMvKc-yGsrygQFA-1
IronPort-SDR: FPtxwJ9jfIWxweLGmR9zVVW3UkcnCc2nbwfn3kdjJTPKvxxcJXvoukq+SiQ3Rk/Oy3GM8kOvRV
	MGhTHDhpannu4xZ3MjiQZCEoleObnSpYcdDFBAYwn332VFwoIiC7unQupej+QxSnisJUIpRzMf
	34rAarUu40gQfQZQDbPCDDFURZ3C49WA9iv5ndVrtUSCH/Zo3X9Ja3nvHFANP3y4ndqOcYSh7+
	JBePmUy7WWSY+ADoR2ljPwkkWCNSywsPViMTrWuK9XE85c557QWgYBTFonx+KuPqvdjxWUbJJP
	HTg=
X-IronPort-AV: E=Sophos;i="5.73,379,1583164800"; d="scan'208";a="137400997"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 19:25:03 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6549.namprd04.prod.outlook.com (2603:10b6:a03:1d2::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34;
	Mon, 11 May 2020 11:25:02 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 11:25:02 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Mon, 11 May 2020 11:25:02 +0000
Message-ID: <BY5PR04MB69008CD2C559E69DC17158C8E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<f3b1182e-45fb-4b8b-71ca-a1b340403260@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c022514-6291-44fc-6a86-08d7f59df295
x-ms-traffictypediagnostic: BY5PR04MB6549:
x-microsoft-antispam-prvs: <BY5PR04MB6549829636AC1A83562493D1E7A10@BY5PR04MB6549.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0WW+bBHva+RCOYI8kn1JnipecFDCPGaJeh2oCz5oAB1zdNnYl5KvkJF9/a7tlw/gjzwBRdtlJkjdou7gs4TzgRGUsso+NwJl5pgU/0vykHfoomCJfsDF2rtuMZopVj1Vi1aiV+Zj6ZHaJmg7VUCJgLBQOAq0ySc6unfOIh5l03U72zKyMuZ/EEKHSlGI4sW6mAAfnUtukNRFhxDMOt0bbqVVt5oVv1p3P5UINlpjHft2oh6y0ZHvnbYR4NNSw0lbikAgh017ct6VJvKR44ygGxkOYxHhLVi1myCmsYpGQ0pWhlFqphRT0RXo3Aaif+zb5AeCqZr2TEFlcwJWKlkfoyqGDoFixNX+q6hcZDGU/TC3p5oVCWuoZVECHsQjZ9n383mYoIcMuivsKAejntVccfzADUDDz946VnnDAKd1YTpv/M9MwYn4yfEVXs+BWwsIZzOU5MKTCRxbqKQwac2nrN+JYWC5xH54AJsJB+bB4ksUpyvrBgQlq1i9I6WqmU19q7JjS9u9YQN3y8X+2rY9Hw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(33430700001)(186003)(6506007)(53546011)(86362001)(71200400001)(5660300002)(76116006)(66446008)(8676002)(64756008)(8936002)(66556008)(66476007)(2906002)(478600001)(66946007)(110136005)(54906003)(33440700001)(316002)(26005)(55016002)(4326008)(9686003)(7696005)(33656002)(52536014);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 0tujz6kq3VF8dmN1H/eAn8xD7douGzfSCvJYhidtw8b8qJwnE/5NVtObE6lgq27xzRKbSVfwFkui4J16WdPoCeDKLgQ63CLhG3hfX/v6SW46W2rDiWAZ9Ibf1ClYq9DBz5YEcmylEOpOY1ayYV8E7+LQKl/eOVGWS66qojIFAXGE1QWQ0atCFojmBvE8RHJEtWWMoG6pwaB3AyjOE9JU8Kgt5fI7Az6xDni//sEnzr+o0IfT3TekOBm4iaJhhtD9qG/CQL/Qrq094i7jHawaGgYR2PddruKrvX6HYC3jxvgGcZzQXQxBgZGXbK7evWl6zZ561GoVe1aLdFuJQuj2B6Q0NyGzXmGuxG5qRTFi2X+t+6jzQS2+ydOSMT3eriZo6mxudAXklWEWUV2drUE++ljFI8fTJX8zo8093MlHLxNDMHUfSik16xFYvqz7C+tvEMujGk+cbEjLGaeG7fxzbqi6mViU3ZI5JwooegO0EoS4UC8BXzARWcI+5KKJCKrn
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c022514-6291-44fc-6a86-08d7f59df295
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 11:25:02.2742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpZvHwLQlFRKxKQUYJabNTuO3I0B+krtz2GPLzlE5G4LKA8WTSkXZA3RnUkRJYtSMyx2ernp/qaaGEaWf8g6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6549
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BBPBfn018540
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/11 20:19, Hannes Reinecke wrote:
> On 5/11/20 12:55 PM, Damien Le Moal wrote:
>> On 2020/05/11 11:46, Damien Le Moal wrote:
>>> Mike,
>>>
>>> I am still seeing the warning:
>>>
>>> [ 1827.839756] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>> [ 1827.856738] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>> [ 1827.874031] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>> [ 1827.891086] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>>
>>> when mixing 512B sector and 4KB sector devices. Investigating now.
>>
>>
>> OK. Figured that one out: the 500GB SSD I am using for the regular device is
>> 976773168 512B sectors capacity, that is, not a multiple of the 256MB zone size,
>> and not even a multiple of 4K. This causes the creation of a 12MB runt zone of
>> 24624 sectors, which is ignored. But the start sector of the second device in
>> the dm-table remains 976773168, so not aligned on 4K. This causes
>> bdev_stack_limits to return an error and the above messages to be printed.
>>
>> So I think we need to completely ignore the eventual "runt" zone of the regular
>> device so that everything aligns correctly. This will need changes in both
>> dmzadm and dm-zoned.
>>
>> Hannes, I can hack something on top of your series. Or can you resend with that
>> fixed ?
>>
>>
> I _thought_ I had this fixed; the idea was to manipulate the 'runt' zone 
> such that the zone would always displayed as a zone with same size as 
> all the other zones, but marked as offline. IE the (logical) zone layout 
> would always be equidistant, with no runt zones in between.
>  From that perspective the actual size of the runt zone wouldn't matter 
> at all.
> 
> Lemme check.

Was just playing with dmzadm right now, and I did notice that the second device
start offset is indeed a round number of zones, larger than the actual regular
device capacity in my test case. So indeed, that code is in place there.

So the problem may be on the kernel side, something using the first dev capacity
as is instead of the rounded-up value to the zone size... Digging too.

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


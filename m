Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A81CD6EC
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 12:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589194590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uJpF+BilC0oEEmchN6QzMYh/U8DIkCNNXZIPjbS56EE=;
	b=aBQfA1qUYx1Hzebxn44u9o4ji+jLQ3HDq+to7PI2UFBSr078nKcSyJ2UpotCj8FSMjatrm
	rZ9TphRG1wivZWDM0RUZ0Gq79I+9FNkw9dUTXoRlXymhLLFnHntgcQrjkO1f3L8Z3IDBIq
	Pbc3khwFEpGdJlkMCmnwY5nzb2NKn8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-gB8wMiNWMLy0axqeJEJUXg-1; Mon, 11 May 2020 06:56:28 -0400
X-MC-Unique: gB8wMiNWMLy0axqeJEJUXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC124475;
	Mon, 11 May 2020 10:56:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F901002382;
	Mon, 11 May 2020 10:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB3624CAA0;
	Mon, 11 May 2020 10:56:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BAtmmB015890 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 06:55:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2F6AED16C; Mon, 11 May 2020 10:55:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1C4E38CF
	for <dm-devel@redhat.com>; Mon, 11 May 2020 10:55:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D56C51859160
	for <dm-devel@redhat.com>; Mon, 11 May 2020 10:55:46 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-400-mnT3A1-dNzysmLvTtQJymg-1; Mon, 11 May 2020 06:55:44 -0400
X-MC-Unique: mnT3A1-dNzysmLvTtQJymg-1
IronPort-SDR: gpu+jWxHz3fjCcc72Gzpi+Rig077azDqXu26w1PFNZdhSEDN5a9POevJC6lhf3G991d5U8bgxE
	7FptJL7k9yf7NrQxc6yOQIi5zSBQOP/nD2DSkBJnDDJ5qZvTgvQgWBPcA1dLH7yBX7KeXNLQmp
	LKzMYonCIWB3jCMSxENekdQ9lbhTxWlOFki1nljfvzr4Fpv44rs3icHDnz6iBiYuTOsa6R2TB3
	Wodf955eZo2XbBucr4kMCNKSME5621/cv8dzBNB7n59bgmIXQDT733M2HIvwam30MnYr3+8AMJ
	0r8=
X-IronPort-AV: E=Sophos;i="5.73,379,1583164800"; d="scan'208";a="137733863"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 18:55:43 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6280.namprd04.prod.outlook.com (2603:10b6:a03:1e2::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28;
	Mon, 11 May 2020 10:55:41 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 10:55:41 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Mon, 11 May 2020 10:55:41 +0000
Message-ID: <BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6b3f41ce-ce33-4311-e6e4-08d7f599d90e
x-ms-traffictypediagnostic: BY5PR04MB6280:
x-microsoft-antispam-prvs: <BY5PR04MB6280896943C26F880A51AF73E7A10@BY5PR04MB6280.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kUmKNcXYX1HC8uU4wSA9jEtx1AeC5Wwj3FORSEhdnDw8xfFZhj4rRnRH4eoja82fxq/VqP2VCLBJ4X69G+KhpplAgJ6Yy8jxWcpm+OCjRkQsfhNO/oGFjM4mn8Lp/tytXtuTBHDfRF0I3NCYjFtwe/Adj0kckOhbrmZ3fjlRiEtFfHIMP5KvxEXoxohxVR1hQlXm1TUmEIfOuxDJNRoEAL3cOq0vaqiyNvzvOUAsZEh+9bwBriXfRwcXbtaWPesTD2bgSi0/liBhbwEqyV7eGSXBdQ4ESQVto8iSQUk6gA9ZdLCzFnxZTqJM4JnaflyUUwtOqaEKoLDliRQxT755bF6sJcNMccYl3fGe1Qq3IZp24WznWn7EnrMvzOxK9oyaqxfCD7YI3+BTDHr2o+2BzRtmyfRyAZ95aKQKsgGmy43XwrAGA5CaFjmZYSUqFrABfj2cfjNoA3ddyIrY3ILt5EuIgXMFw2VHza1ov/K+15BHewMCotgwn2A3hI/TzZkTfbBKo6uap3qUJYi0Jp87nQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(33430700001)(33656002)(66946007)(86362001)(66476007)(76116006)(5660300002)(71200400001)(4326008)(2906002)(52536014)(54906003)(9686003)(110136005)(33440700001)(478600001)(26005)(7696005)(316002)(64756008)(6506007)(53546011)(66556008)(66446008)(8936002)(8676002)(55016002)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: jdxJHgnv7m3XTGVck0cznLdbPZ3lEvWLbinn5nfC+FHIeL1W+k0ESniGtHVwMGSmMC9DOOaSmYMZf2dkITl/J3EEkv1MOcdwCS4AC8UEOweQQiP7qi5UyYwIeWbt6LXa/o53K4072U0sR/zFPLtnjAXNCteLW/ttqJ0PZXH4iT/7vYq0us3uqV4RONoSV1sB7urMPGfZNQNBZBOqjrr1D0xTo7f+lRSkYEkfWTiOtnqouS1xer9gQA9fyUBw+/h8btc+/OIKz5XSvjwss4CE5lNDmb4NmHniqv83WKuugE+h5S6Gb0PyG9eXYC0k9Y6dkDPE939vzJ9p61ayCgGw7CVzVVt26KZBsCg/5s6TkdfiKU75ajlHcO0W8by28T1i4f+fhyKB1ifgSMhD0YDFMV7SNkr8A6dh995AghiS2hRyZ2fUY7lclZfQTbhy441PhMCrTJr10T7J2u2WYD2+VAk+TOpaiDGUiNcuqMHSX7F8dOB6YbgmALWg+IEBCxIc
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3f41ce-ce33-4311-e6e4-08d7f599d90e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 10:55:41.4318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbIuBnN1vLmPrQgrMP7G+VXVRGcXTHeVluSJZ/MfRuxgUoLPTln9dXI11ie9dXvLw39HCDpC+VgIW0FnRi8G7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6280
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BAtmmB015890
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/11 11:46, Damien Le Moal wrote:
> Mike,
> 
> I am still seeing the warning:
> 
> [ 1827.839756] device-mapper: table: 253:1: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> [ 1827.856738] device-mapper: table: 253:1: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> [ 1827.874031] device-mapper: table: 253:1: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> [ 1827.891086] device-mapper: table: 253:1: adding target device sdj caused an
> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
> alignment_offset=0, start=0
> 
> when mixing 512B sector and 4KB sector devices. Investigating now.


OK. Figured that one out: the 500GB SSD I am using for the regular device is
976773168 512B sectors capacity, that is, not a multiple of the 256MB zone size,
and not even a multiple of 4K. This causes the creation of a 12MB runt zone of
24624 sectors, which is ignored. But the start sector of the second device in
the dm-table remains 976773168, so not aligned on 4K. This causes
bdev_stack_limits to return an error and the above messages to be printed.

So I think we need to completely ignore the eventual "runt" zone of the regular
device so that everything aligns correctly. This will need changes in both
dmzadm and dm-zoned.

Hannes, I can hack something on top of your series. Or can you resend with that
fixed ?




-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1A51D2515
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 04:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589422947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KnnE6whLR+n1+Y/D3FErHP4KXPlYbNxwAjtM6tjUmzc=;
	b=cY9SG8PHHnhsktbyQakvRjc9Ld9VtBaxCkvH6JFN2hk+zOiSl5bxwgC2WGaWWJhcR5+4mn
	Pe7LBNsobPhJ36RIxk9YqDidA/EArHNTPpIlRxBfc525gBYu1bNryWd/3YyENmz5J8+aFT
	FffiPVoCnCWhJS3G30y88KNJz0uoh+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Dw-XpF-zPdCHtAXNisQJmw-1; Wed, 13 May 2020 22:22:25 -0400
X-MC-Unique: Dw-XpF-zPdCHtAXNisQJmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75D3C474;
	Thu, 14 May 2020 02:22:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D9A61538;
	Thu, 14 May 2020 02:22:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B83CC4E585;
	Thu, 14 May 2020 02:22:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E2MDUb016536 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 22:22:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 829D4106B461; Thu, 14 May 2020 02:22:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F322B106B460
	for <dm-devel@redhat.com>; Thu, 14 May 2020 02:22:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 992BB186E3A7
	for <dm-devel@redhat.com>; Thu, 14 May 2020 02:22:09 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-54-zv8NopqoOUSMkfioWVqPCA-1; Wed, 13 May 2020 22:22:07 -0400
X-MC-Unique: zv8NopqoOUSMkfioWVqPCA-1
IronPort-SDR: vaRP2GDHtJ2ElU+e9J7H+zeTtLrlrbkjdaYNQmOveUEJANSmCvGU7ZYocqTFzJOHnpC+zx+qmG
	9BBbejaq5ImQcz1cIaEDApx0YnDM6th1C6zSEalYjupW81uGkYxf8d4Pd361BXrGHEL2jjP9Em
	X65Y1EJzwuIUu9uKUqESBkWPUm5UG7C9N/DIbbLTnumKeF9wjOHXKdU0idFfYUAKPvQlPyglR1
	1lFtO+eeOJzJqjDtPJVI7irGgy8kMN2zmEX7bcWU6cFQt6WDpJMdJ9ZU4BC9azSF+JmRV3/F0G
	oP8=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; d="scan'208";a="139066825"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 10:22:05 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6993.namprd04.prod.outlook.com (2603:10b6:a03:226::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24;
	Thu, 14 May 2020 02:22:04 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Thu, 14 May 2020 02:22:04 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Thu, 14 May 2020 02:22:04 +0000
Message-ID: <BY5PR04MB6900D391965BBADE58692DB1E7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
	<BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690020AE68E7A20EA8BFED0DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690002ABF208B084607B6971E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq13683z7sj.fsf@oracle.com>
	<BY5PR04MB6900B82F4BEE1B13B239D93EE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq1h7wjxnph.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bb138a26-4f34-46ca-ccea-08d7f7ad97ab
x-ms-traffictypediagnostic: BY5PR04MB6993:
x-microsoft-antispam-prvs: <BY5PR04MB6993DA6E2D6A534F0034B32FE7BC0@BY5PR04MB6993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s0e2D16OI79+7vS7lsO+BiBlgDs+aJIBLnYCaKRaukPbvTu567dL9gIbjkSnQoW6pf7/bwwN6xU2vQWe9qZneHuqp0o9R0eTCVLTtuYuR4QLahN63oaFIGlPde9qzd4OODYpuB3YMaDw16i2fBGyaNhq+Np+MS2J5O53B8KdjgSBY8QpEVJkSXkL6XcRR/vnttPTBOlAdhWRn8t4D3LX2AqsGlqjjsVOkM6sJuPJBTR6fmeI71D2h171aji51ROPklnsnFn1kH8kG/uMKTa3Qct4fg1n8AcOKxpXrXGm7GqjB412kSEDLLFDJHkJTZIF1PfFmzcNbQHnZ5lnPt3rCHMbhjLgW8c3MCs0qklOYB/582h59pEV3ZdW6lVh/IH29G8ZMh1+LctYODy4PijKK8Di6T1hJE97KIvkPIw+xBvcWjNFm9WPkL4Cdsyd+EnG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(33656002)(71200400001)(53546011)(6506007)(4744005)(86362001)(9686003)(26005)(186003)(8936002)(8676002)(2906002)(55016002)(66556008)(4326008)(66446008)(64756008)(5660300002)(66946007)(54906003)(52536014)(66476007)(6916009)(7696005)(316002)(478600001)(76116006);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: aKO88ywTy/QUnZLJfUPTShkIAbWY8Ep6UmEMabXWxQdjEKvV3NL4Vav7oymD2hIH8vnAuIXDRpvKVb9/M+YUIVjouKx7FyEfGeg44DWi6uSX7YuAKlXk3b+5xDpJYvvVL4MUZ3NHOn5xrPbKCLHK46gEW8CySAi9j4NoYc9jRGFR9YwQzmu3jXjTKE1+ucnedbRCtdOpUQzhBwk3YQCQt2TYbT+8xCfaLb/79tHe74FSb5646Z8SYQTx7H82Lez9GA61UY6RVsAcDnN0csw0b5Q+ZTqgy5uW+HN/S0Adf2KGLJEXVeUhDoXxpTVCmT6gCFcUYp1oYzfgWcky62EAlM8uRMGGM0UJm9fQqpmem8zyLCW/N4U1d1ytQacJ/6FFSRPYfPmt8YA2CjbPjJIDwPkGZssPgecDcwsVgWcAIhBM97B9O5GnVNx3AxrL4gOwGuvrakxbqBsVMJTk8qlPkC65UeQINfK46WxPZYBFYhXv9ZjLWNxKG46QDNcjNclM
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb138a26-4f34-46ca-ccea-08d7f7ad97ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 02:22:04.1140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFLZTr07qZwfqA0b9NWS1LNUT+bEDTvhIsu9cxR4WJL6IdqvBXgyi77jVz50xmgz+B9ZCut99gY4WsGPqpiN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6993
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E2MDUb016536
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/14 11:20, Martin K. Petersen wrote:
> 
> Damien,
> 
>> Indeed. It is an NVMe M.2 consumer grade SSD. Nothing fancy. If you
>> look at nvme/host/core.c nvme_update_disk_info(), you will see that
>> io_opt is set to the block size... This is probably abusing this
>> limit. So I guess the most elegant fix may be to have nvme stop doing
>> that ?
> 
> Yeah, I'd prefer for io_opt to only be set if the device actually
> reports NOWS.

Sent a patch :)

> 
> The purpose of io_min is to be the preferred lower I/O size
> boundary. One should not submit I/Os smaller than this.
> 
> And io_opt is the preferred upper boundary for I/Os. One should not
> issue I/Os larger than this value. Setting io_opt to the logical block
> size kind of defeats that intent.
> 
> That said, we should probably handle the case where the pbs gets scaled
> up but io_opt doesn't more gracefully.

Yes. Will look at that too.

Thanks !

> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


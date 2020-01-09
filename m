Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B343513513E
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jan 2020 03:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578535548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hu9Dp4VTQh5a8v9UrGJ32vgTLX8WLsqFWrRs9b2avds=;
	b=EhQzHSx+SllizPtbhqq74OOWIDYShMYFfoH3BwQo6/iaOWqTS4FZgWVXIDmJ1u7ESxQMDo
	tdElaeCReG6sP+nR4IV74eBu8bgY07S3g6rIDLjY2vwOoMh6YVKDYqAVvazATwB0NIduzF
	roFD7pvkvzvDINmwZKdTCYFAruphhK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-nyPZ0H75NfSJUgKZTNeIFg-1; Wed, 08 Jan 2020 21:05:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F73E1005512;
	Thu,  9 Jan 2020 02:05:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B9DC86C5F;
	Thu,  9 Jan 2020 02:05:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6543503A4;
	Thu,  9 Jan 2020 02:05:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 009259ZS021790 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 21:05:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 67C2C2026D67; Thu,  9 Jan 2020 02:05:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E3F20292BF
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 02:05:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C30FC800A1B
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 02:05:06 +0000 (UTC)
IronPort-SDR: 6KnVZRn92a89s+lP9Mby7sQ7dpbqgyILLrdWoR+0hB6ufrsvhURdtqvhNRcXMFJ9+KDvObfFKD
	NKzUsyUDsxTpfYKzhDgh0IOEmQKSLdneZxD6c5KmjyrVNQdWRQsT4JrhGUYm6EwPMCxjDYpU5i
	BH/6V486hxEAk74+fIF8U6xWGVZf5HWd2Ua8SANlwabtEFdvXHe+lU4JrIwvdb4ZmD0zFFNPzV
	KiF+lzvcPRjxt6G4D/To1iIZRDfNnOuGmpnjyp0LaDLYQaWjO7CZ/VNhs06NFxqMBAHb8YgscQ
	bOE=
X-IronPort-AV: E=Sophos;i="5.69,412,1571673600"; d="scan'208";a="234800942"
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-376-32miw_dBOeezDaQizmAO2Q-1; Wed, 08 Jan 2020 21:05:05 -0500
Received: from mail-sn1nam04lp2055.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.55])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jan 2020 10:05:02 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB3862.namprd04.prod.outlook.com (52.135.214.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.9; Thu, 9 Jan 2020 02:05:01 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2602.017;
	Thu, 9 Jan 2020 02:05:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH] dm-zoned: extend the way of exposing zoned block
	device
Thread-Index: AQHVxfMPtnSx9ygQV0yw4PguyV00/g==
Date: Thu, 9 Jan 2020 02:05:01 +0000
Message-ID: <BYAPR04MB5816DF518F723BE1A9776C62E7390@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
	<BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<9e7d2f84-6efa-7c44-2313-860d5e8ed067@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5c59a85-d275-4695-2bff-08d794a8560d
x-ms-traffictypediagnostic: BYAPR04MB3862:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB386213559409BBBE1E93EA25E7390@BYAPR04MB3862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(81156014)(316002)(9686003)(8676002)(81166006)(33656002)(66556008)(66946007)(2906002)(76116006)(91956017)(54906003)(110136005)(66446008)(64756008)(66476007)(71200400001)(55016002)(4326008)(478600001)(6506007)(53546011)(7696005)(86362001)(26005)(52536014)(186003)(8936002)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3862;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2oeDa6EhN6cqMKCwhMziFPjMyxossIjRqal9YeSyVE1WB4n5Bdzusaom2dz2OmX6RU/xgaRRCtFFLCdP3q+TWqMp6ncTCAnS80FotSIrQmpNz2Rm+3zh4uPDSHknoXKez3WfYrLmne+2UMz0ObZR3Fa/bNGFq0/X+3F/TBi3pa/B0eXnr52G+c5m9oLjQQqOtvmFyTfy/JOLIkluGW9/yCHjL49sD22E8bd23hEg2p8kUdpQdxX71Bo2JJCi4FHg7Su2g/vTHQYon+7aDFQ1Wc9C9cDopwZLz6yAesZSDp6vt2/Fn/6YxyJz+XwFttBGAyURr29Wb1GlIqs/hyp47/LrTJhPwepS6ofAT0Fu6jKtzB+fxxqAOsCk7hNH3KPKshEyf10CRCtYNIECNPWxtM3SKDif9geIJ+KS1AJqnsBkQMGxwv0LINo5XRSU62SR
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c59a85-d275-4695-2bff-08d794a8560d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 02:05:01.2976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2iK0nFCD1KAUCXERz4zKiTeAdOdqfezl+lFZzpczvKDyqTDts6uSKvCeK+pGrKrz0qLP0y6njlHEhDlSPRPCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3862
X-MC-Unique: 32miw_dBOeezDaQizmAO2Q-1
X-MC-Unique: nyPZ0H75NfSJUgKZTNeIFg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 009259ZS021790
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"shirley.ma@oracle.com" <shirley.ma@oracle.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH] dm-zoned: extend the way of exposing
 zoned block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/01/08 22:49, Bob Liu wrote:
> On 1/8/20 3:40 PM, Damien Le Moal wrote:
>> On 2020/01/08 16:13, Nobody wrote:
>>> From: Bob Liu <bob.liu@oracle.com>
>>>
>>> Motivation:
>>> Now the dm-zoned device mapper target exposes a zoned block device(ZBC) as a
>>> regular block device by storing metadata and buffering random writes in
>>> conventional zones.
>>> This way is not very flexible, there must be enough conventional zones and the
>>> performance may be constrained.
>>> By putting metadata(also buffering random writes) in separated device we can get
>>> more flexibility and potential performance improvement e.g by storing metadata
>>> in faster device like persistent memory.
>>>
>>> This patch try to split the metadata of dm-zoned to an extra block
>>> device instead of zoned block device itself.
>>> (Buffering random writes also in the todo list.)
>>>
>>> Patch is at the very early stage, just want to receive some feedback about
>>> this extension.
>>> Another option is to create an new md-zoned device with separated metadata
>>> device based on md framework.
>>
>> For metadata only, it should not be hard at all to move to another
>> conventional zone device. It will however be a little more tricky for
>> conventional zones used for data since dm-zoned assumes that this random
>> write space is also zoned. Moving this space to a conventional device
>> requires implementing a zone emulation (fake zones) for the regular
>> drive, using a zone size that matches the size of sequential zones.
>>
> 
> Indeed.
> I'll try to implement zone emulation next version.
> 
>> Beyond this, dm-zoned also needs to be changed to accept partial drives
>> and the dm core code to accept mixing of regular and zoned disks (that
>> is forbidden now).
>>
> 
> Do you mean the check in device_area_is_invalid()? 
> 
>  320         /*
>  321          * If the target is mapped to zoned block device(s), check
>  322          * that the zones are not partially mapped.
>  323          */
>  324         if (bdev_zoned_model(bdev) != BLK_ZONED_NONE) {

This is only to check that the mapping are zone aligned for zoned block
devices. I was referring to the checks done using the
device_is_zoned_model() callback in dm_table_supports_zoned_model()
which restricts mappings to be *all* on top of zoned disks for targets
that have the DM_TARGET_ZONED_HM feature set. That code will prevent
using a regular SSD and an SMR disk for dm-zoned. A new feature (e.g.
DM_TARGET_MIXED_ZONED_HM or something) will be needed.

Best regards.


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


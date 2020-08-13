Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED1B244538
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:06:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-UXaFp7pRNomUj2Z7WS9lRg-1; Fri, 14 Aug 2020 03:06:24 -0400
X-MC-Unique: UXaFp7pRNomUj2Z7WS9lRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B299410082E8;
	Fri, 14 Aug 2020 07:06:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CF43747BD;
	Fri, 14 Aug 2020 07:06:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43CCD181A06C;
	Fri, 14 Aug 2020 07:06:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DNpwjW020034 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 19:51:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B0C02166BB3; Thu, 13 Aug 2020 23:51:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFAC22166BA3
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 23:51:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 308B8101A540
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 23:51:55 +0000 (UTC)
Received: from act-MTAout2.csiro.au (act-mtaout2.csiro.au [150.229.7.38])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-QUThARYsMtaiALjxe2ssDw-1; Thu, 13 Aug 2020 19:51:51 -0400
X-MC-Unique: QUThARYsMtaiALjxe2ssDw-1
IronPort-SDR: 1x6NapXQdda5yqdlQQcnRIZoENdhqbn0iBdLgwkOZxPzGTKCb3eHeD7HVqbkAWX2v98Qz3gEXg
	ECsaz6FU0fBw==
X-SBRS: 4.0
IronPort-PHdr: =?us-ascii?q?9a23=3Agz/TJhPNN1GuV5DXak4l6mtXPHoupqn0MwgJ65?=
	=?us-ascii?q?Eul7NJdOG58o//OFDEvKw23lDMVITfrflDjrmev6PhXDkG5pCM+DAHfYdXXh?=
	=?us-ascii?q?AIwcMRg0Q7AcGDBEG6SZyibyEzEMlYElMw+Xa9PBtaHc//YxvZpXjhpTIXEw?=
	=?us-ascii?q?/0YAxyIOm9E4XOjsOxgua1/ZCbYwhBiDenJ71oKxDjph7QrM5QiJYxJw=3D?=
	=?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+FEAABV0TVfjACwBSSwhIATAJKcgDR?=
	=?us-ascii?q?fGgEBAQEBAQEBAQEDAQEBARIBAQEBAgIBAQEBQIFKgVJRYhWBMwqELYNGA41?=
	=?us-ascii?q?cmzoDVQsBAQEMAhsSAgQBAQKBA4NHAheCKgIkOBMCAwEBCwEBBgEBAQEBBgQ?=
	=?us-ascii?q?CAhABAQEmhgwMg1OBAgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQEFAoEHBT4BAQEDEhERDAEBNwEPAgEIGAICJgICAhIeFRIEDieDBAG?=
	=?us-ascii?q?CSwMtAQEEqAwCgTmIYAEBdYEygwEBAQV7hDUYgg4JCQGBBCqCcYNghkCBXD6?=
	=?us-ascii?q?BEYMQPoQVGSaDADOCLY9SCBCDFYoAP5huBwMggkKIY4cKiiACDSGCfoEjm3S?=
	=?us-ascii?q?UIJh9hE0CBAIEBQIOAQEFgWqBe2yDPQlHFwINjh8MDgmDToZxg2V0NwIGCgE?=
	=?us-ascii?q?BAwl8jUIBgTMBgRABAQ?=
X-IPAS-Result: =?us-ascii?q?A+FEAABV0TVfjACwBSSwhIATAJKcgDRfGgEBAQEBAQEBA?=
	=?us-ascii?q?QEDAQEBARIBAQEBAgIBAQEBQIFKgVJRYhWBMwqELYNGA41cmzoDVQsBAQEMA?=
	=?us-ascii?q?hsSAgQBAQKBA4NHAheCKgIkOBMCAwEBCwEBBgEBAQEBBgQCAhABAQEmhgwMg?=
	=?us-ascii?q?1OBAgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEFAoEHB?=
	=?us-ascii?q?T4BAQEDEhERDAEBNwEPAgEIGAICJgICAhIeFRIEDieDBAGCSwMtAQEEqAwCg?=
	=?us-ascii?q?TmIYAEBdYEygwEBAQV7hDUYgg4JCQGBBCqCcYNghkCBXD6BEYMQPoQVGSaDA?=
	=?us-ascii?q?DOCLY9SCBCDFYoAP5huBwMggkKIY4cKiiACDSGCfoEjm3SUIJh9hE0CBAIEB?=
	=?us-ascii?q?QIOAQEFgWqBe2yDPQlHFwINjh8MDgmDToZxg2V0NwIGCgEBAwl8jUIBgTMBg?=
	=?us-ascii?q?RABAQ?=
Received: from exch4-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:34])
	by act-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	14 Aug 2020 09:51:45 +1000
Received: from exch4-cdc.nexus.csiro.au (2405:b000:601:13::247:34) by
	exch4-cdc.nexus.csiro.au (2405:b000:601:13::247:34) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 14 Aug 2020 09:51:44 +1000
Received: from ExEdge1.csiro.au (150.229.7.34) by exch4-cdc.nexus.csiro.au
	(152.83.247.34) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
	Frontend Transport; Fri, 14 Aug 2020 09:51:44 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.50)
	by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
	15.0.1497.2; Fri, 14 Aug 2020 09:51:39 +1000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com (2603:10c6:220:3c::18)
	by MEXPR01MB1095.ausprd01.prod.outlook.com (2603:10c6:200:1::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15;
	Thu, 13 Aug 2020 23:51:43 +0000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e]) by
	MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e%7]) with mapi id 15.20.3283.016;
	Thu, 13 Aug 2020 23:51:43 +0000
From: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Thread-Topic: [dm-devel] Promise and ALUA
Thread-Index: AQHWbs9fLG+eDTnEKkiNCju3lFnLRak2fTaAgAA+j4A=
Date: Thu, 13 Aug 2020 23:51:43 +0000
Message-ID: <20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
	<8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
In-Reply-To: <8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83ac85fe-15db-4a86-abcb-08d83fe3d4fa
x-ms-traffictypediagnostic: MEXPR01MB1095:
x-microsoft-antispam-prvs: <MEXPR01MB1095083A8E1FA04FBD8B0528F4430@MEXPR01MB1095.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6QxuUAApE+pkVHddpL/+80L2ocVixxppDiUcRwxB8svzEK7rHMzwQGnWI0Dt9Np1gw8LSWDaNmt+tHQIhO+liRH9qHeZp5pt6mDtgTxbepL4sBt8OVmDhszY2f3alLARNnGY0wzDp7vuS8d4FyUCniXpwmBai+HeMooPW280bgb7UIU6gRglJh0w2C5bA8zpQUEDv0+Bwysop2g3rFQCjkQqkdpDsJYvGBbEvpIYR5/VdQwHfeEEif7kL4ONSI9VxIrWJw2ZUwbVifmvrZoan4fUx61/fOBZHlapaCrjcSvrVe0sKSbBOfwLTkO5MlaS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MEAPR01MB4517.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(186003)(1076003)(26005)(8676002)(8936002)(2906002)(30864003)(6512007)(86362001)(5660300002)(6506007)(6916009)(66946007)(83380400001)(76116006)(478600001)(316002)(4326008)(4001150100001)(66476007)(91956017)(71200400001)(33656002)(66446008)(64756008)(66556008)(6486002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: QsKTJWo3LnadwUjUHTSutu8UIU+F//IItTuZGlnMGlK17qiMuOfBgOkyLy9GzG2+yvk7U99bJ8AF2xsXndLfPo2luyGMmI2EoSfwE/UgGnUNIhZshjMcz3Kkj1UQYbgafxj+sADS3swUp3wKLCgLxaz+x6HDsaldCL3mhYWJzgtfS58QqeuB8F3R2phQJeZi2/GJpI4Rxa3DoausEnQloHRZ3FmhJzyL8+mE83dJXCNKjieQeTniHtdLWgLIyNMwUpQgnXvk5Qg1ef+21Gh5+o+G/3A40zu56kaDY+2RAgj90op1H0TA5ivAYtipcbDMe60uMA+G74tasE43HOEHPKS6jU7tl7JKTaNg3XLOTvu1ppmN9wFWwOJUzVDdKn3lpJeXOSeAJlJL0xPQ1JydyErHilR6NKtmM0r6+qde26tlUgkgU3EcmMAfRWPuItjA1bI3ia+EeSRS99JNaRw+WKjXjw72/w4kuuitFD3iT0vOXICT8T36XTOfbDWBtScekhSSTEjf4+wRkbs2d48aje8MzwQ6z85adirxcxrKaV5RsOtAICYl3xcYS181BPuIYfZHiDGP91Db6MEc/QUg3B2NZlb1TUEauqN2VWftatA6VQcHOsb/uJAyaZ4L0V6SdVPs4N0OUZt/LkggVLtN7A==
x-ms-exchange-transport-forked: True
Content-ID: <3DCC61EC5FA6BB469026F334A210DAC8@ausprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEAPR01MB4517.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ac85fe-15db-4a86-abcb-08d83fe3d4fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 23:51:43.5499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GvlH9hNGoHH0NxXo11fYcEiH9pW20JAF2JfbxMVzX3wP6YvaShmQxora04Cg0+vV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEXPR01MB1095
X-OriginatorOrg: csiro.au
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07DNpwjW020034
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] Promise and ALUA
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

On Thu, Aug 13, 2020 at 10:07:49PM +0200, Xose Vazquez Perez wrote:
>On 8/10/20 6:33 AM, McIntyre, Vincent (CASS, Marsfield) wrote:
>
>>for many years we have been operating some Promise VTrak arrays
>>without any use of the ALUA feature (largely so we don't have to
>>specify LUN affinities as well, which seems to be required).
>>
>>In the process of upgrading to Debian Buster
>>(multipath-tools 0.7.9 and kernel 4.19)
>>I find that I can no longer connect to our Promise arrays.
>>They are detected but the only useful output I get is
>>
>>  multipathd[986]: reconfigure (operator)
>>  multipathd[986]: sdc: alua not supported
>>  multipathd[986]: sdd: alua not supported
>>  multipathd[986]: sdr: alua not supported
>>  multipathd[986]: sde: alua not supported
>>  multipathd[986]: sdf: alua not supported
>>  multipathd[986]: sdg: alua not supported
>>  multipathd[986]: sdh: alua not supported
>>  multipathd[986]: sdi: alua not supported
>>
>>
>>I found the note in the manpage about alua being selected by
>>default for these arrays[1], but I'm taken aback that I'm not
>>allowed to override this.
>>
>>Is there really no support any more for choosing whether to use
>>ALUA or not?
>>
>>I have tried messing about with detect_prio, dectect_checker
>>and whatnot, to no avail.
>
>>[1] 9b5ea2eda85ae072cb697310807611c693713c2b
>>     libmultipath: retain_attached_hw_handler obsolete with 4.3+
>
>With the next array config and an empty /etc/multipath.conf,
>reboot the linux host and put the output of "multipath -ll"
>Redundancy Type: Active-Active
>LUN Affinity: Enable
>ALUA: Enable

TL;DR I found a way forward, manually running multipath -a.
Details below, and a suggested tweak to the manpage.

I created a new LUN on the vtrak and mapped it to the test host.
The host sees it, but as expected there's no new multipath yet.
lsscsi does not show a new set of scsi devices either,
which is also expected.

 qla2xxx [0000:04:00.0]-107ff:1: qla2x00_fcport_event_handler: schedule
 qla2xxx [0000:04:00.0]-107ff:1: qla_scan_work_fn: schedule loop resync
 qla2xxx [0000:04:00.0]-280e:1: HBA in F P2P topology.
 qla2xxx [0000:04:00.0]-2814:1: Configure loop -- dpc flags = 0x60.
 qla2xxx [0000:04:00.0]-107ff:1: qla2x00_fcport_event_handler: schedule
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260700015553ce36 portid=1e0260.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260600015553ce36 portid=1e0280.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260200015553ce36 portid=1e02a0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260300015553ce36 portid=1e02c0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260100015553ce36 portid=1e0300.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260000015553ce36 portid=1e0320.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260500015553ce36 portid=1e0340.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260400015553ce36 portid=1e0360.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 20000024ff002350 pn 21000024ff002350 portid=1e0500.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203300a098b16b5f portid=1e08a0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203200a098b16b5f portid=1e08a1.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206300a098b16b5f portid=1e08c0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204200a098b16b5f portid=1e08c1.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204300a098b16b5f portid=1e0900.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205200a098b16b5f portid=1e0920.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205300a098b16b5f portid=1e0940.
 qla2xxx [0000:04:00.0]-107ff:1: qla_scan_work_fn: schedule loop resync
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206200a098b16b5f portid=1e0960.
 qla2xxx [0000:04:00.0]-286a:1: qla2x00_configure_loop *** FAILED ***.
 qla2xxx [0000:04:00.0]-280e:1: HBA in F P2P topology.
 qla2xxx [0000:04:00.0]-2814:1: Configure loop -- dpc flags = 0x60.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260700015553ce36 portid=1e0260.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260600015553ce36 portid=1e0280.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260200015553ce36 portid=1e02a0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260300015553ce36 portid=1e02c0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260100015553ce36 portid=1e0300.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260000015553ce36 portid=1e0320.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260500015553ce36 portid=1e0340.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260400015553ce36 portid=1e0360.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 20000024ff002350 pn 21000024ff002350 portid=1e0500.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203300a098b16b5f portid=1e08a0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203200a098b16b5f portid=1e08a1.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206300a098b16b5f portid=1e08c0.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204200a098b16b5f portid=1e08c1.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204300a098b16b5f portid=1e0900.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205200a098b16b5f portid=1e0920.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205300a098b16b5f portid=1e0940.
 qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206200a098b16b5f portid=1e0960.
 qla2xxx [0000:04:00.0]-289f:1: Device wrap (1e0960).
 qla2xxx [0000:04:00.0]-2869:1: LOOP READY.
 qla2xxx [0000:04:00.0]-286b:1: qla2x00_configure_loop: exiting normally.

I emptied /etc/multipath.conf, ran update-initramfs -u and rebooted.
lsscsi shows multiple paths to the new LUN, but there's no new
multipath - all those shown below were already known to the system.
On earlier versions, the new multipath usually appeared automatically.

# multipath -ll

3600a098000b173f60000079e5da82d73 dm-12 DELL,MD38xxf
size=40T features='5 queue_if_no_path pg_init_retries 50 queue_mode mq' hwhandler='1 rdac' wp=rw
|-+- policy='service-time 0' prio=14 status=active
| |- 1:0:10:0  sdaa 65:160 active ready running
| |- 1:0:12:0  sdac 65:192 active ready running
| |- 1:0:14:0  sdae 65:224 active ready running
| `- 1:0:8:0   sdy  65:128 active ready running
`-+- policy='service-time 0' prio=9 status=enabled
  |- 1:0:11:0  sdab 65:176 active ready running
  |- 1:0:13:0  sdad 65:208 active ready running
  |- 1:0:7:0   sdx  65:112 active ready running
  `- 1:0:9:0   sdz  65:144 active ready running
Aug 14 09:33:02 | sdd: alua not supported
Aug 14 09:33:02 | sdg: alua not supported
Aug 14 09:33:02 | sdag: alua not supported
Aug 14 09:33:02 | sdj: alua not supported
Aug 14 09:33:02 | sdm: alua not supported
Aug 14 09:33:02 | sdp: alua not supported
Aug 14 09:33:02 | sds: alua not supported
Aug 14 09:33:02 | sdv: alua not supported
222e300015555469c dm-10 Promise,VTrak E830f
size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=-1 status=active
  |- 1:0:0:20  sdd  8:48   active ready running
  |- 1:0:1:20  sdg  8:96   active ready running
  |- 1:0:15:20 sdag 66:0   active ready running
  |- 1:0:2:20  sdj  8:144  active ready running
  |- 1:0:3:20  sdm  8:192  active ready running
  |- 1:0:4:20  sdp  8:240  active ready running
  |- 1:0:5:20  sds  65:32  active ready running
  `- 1:0:6:20  sdv  65:80  active ready running
Aug 14 09:33:02 | sdc: alua not supported
Aug 14 09:33:02 | sdf: alua not supported
Aug 14 09:33:02 | sdaf: alua not supported
Aug 14 09:33:02 | sdi: alua not supported
Aug 14 09:33:02 | sdl: alua not supported
Aug 14 09:33:02 | sdo: alua not supported
Aug 14 09:33:02 | sdr: alua not supported
Aug 14 09:33:02 | sdu: alua not supported
2221f000155c0792e dm-11 Promise,VTrak E830f
size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=-1 status=active
  |- 1:0:0:5   sdc  8:32   active ready running
  |- 1:0:1:5   sdf  8:80   active ready running
  |- 1:0:15:5  sdaf 65:240 active ready running
  |- 1:0:2:5   sdi  8:128  active ready running
  |- 1:0:3:5   sdl  8:176  active ready running
  |- 1:0:4:5   sdo  8:224  active ready running
  |- 1:0:5:5   sdr  65:16  active ready running
  `- 1:0:6:5   sdu  65:64  active ready running

However I find that I can do this:

# multipath -v 3 -a 2228a0001558b1855
Aug 14 09:35:56 | set open fds limit to 1048576/1048576
Aug 14 09:35:56 | loading //lib/multipath/libchecktur.so checker
Aug 14 09:35:56 | checker tur: message table size = 3
Aug 14 09:35:56 | loading //lib/multipath/libprioconst.so prioritizer
Aug 14 09:35:56 | foreign library "nvme" loaded successfully
Aug 14 09:35:56 | libdevmapper version 1.02.155 (2018-12-18)
Aug 14 09:35:56 | DM multipath kernel driver v1.13.0
Aug 14 09:35:56 | No matching alias [2228a0001558b1855] in bindings file.
Aug 14 09:35:56 | wrote wwid 2228a0001558b1855 to wwids file
wwid '2228a0001558b1855' added
Aug 14 09:35:56 | unloading const prioritizer
Aug 14 09:35:56 | unloading tur checker

# multipath -v3 -r
Aug 14 09:36:24 | set open fds limit to 1048576/1048576
Aug 14 09:36:24 | loading //lib/multipath/libchecktur.so checker
Aug 14 09:36:24 | checker tur: message table size = 3
Aug 14 09:36:24 | loading //lib/multipath/libprioconst.so prioritizer
Aug 14 09:36:24 | foreign library "nvme" loaded successfully
Aug 14 09:36:24 | delegating command to multipathd

and now the multipath device for the new LUN appears.

# multipath -ll
3600a098000b173f60000079e5da82d73 dm-12 DELL,MD38xxf
size=40T features='5 queue_if_no_path pg_init_retries 50 queue_mode mq' hwhandler='1 rdac' wp=rw
|-+- policy='service-time 0' prio=14 status=active
| |- 1:0:10:0  sdaa 65:160 active ready running
| |- 1:0:12:0  sdac 65:192 active ready running
| |- 1:0:14:0  sdae 65:224 active ready running
| `- 1:0:8:0   sdy  65:128 active ready running
`-+- policy='service-time 0' prio=9 status=enabled
  |- 1:0:11:0  sdab 65:176 active ready running
  |- 1:0:13:0  sdad 65:208 active ready running
  |- 1:0:7:0   sdx  65:112 active ready running
  `- 1:0:9:0   sdz  65:144 active ready running
Aug 14 09:36:35 | sdd: alua not supported
Aug 14 09:36:35 | sdg: alua not supported
Aug 14 09:36:35 | sdag: alua not supported
Aug 14 09:36:35 | sdj: alua not supported
Aug 14 09:36:35 | sdm: alua not supported
Aug 14 09:36:35 | sdp: alua not supported
Aug 14 09:36:35 | sds: alua not supported
Aug 14 09:36:35 | sdv: alua not supported
222e300015555469c dm-10 Promise,VTrak E830f
size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=-1 status=active
  |- 1:0:0:20  sdd  8:48   active ready running
  |- 1:0:1:20  sdg  8:96   active ready running
  |- 1:0:15:20 sdag 66:0   active ready running
  |- 1:0:2:20  sdj  8:144  active ready running
  |- 1:0:3:20  sdm  8:192  active ready running
  |- 1:0:4:20  sdp  8:240  active ready running
  |- 1:0:5:20  sds  65:32  active ready running
  `- 1:0:6:20  sdv  65:80  active ready running
Aug 14 09:36:35 | sde: alua not supported
Aug 14 09:36:35 | sdh: alua not supported
Aug 14 09:36:35 | sdah: alua not supported
Aug 14 09:36:35 | sdk: alua not supported
Aug 14 09:36:35 | sdn: alua not supported
Aug 14 09:36:35 | sdq: alua not supported
Aug 14 09:36:35 | sdt: alua not supported
Aug 14 09:36:35 | sdw: alua not supported
2228a0001558b1855 dm-14 Promise,VTrak E830f
size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=-1 status=active
  |- 1:0:0:21  sde  8:64   active ready running
  |- 1:0:1:21  sdh  8:112  active ready running
  |- 1:0:15:21 sdah 66:16  active ready running
  |- 1:0:2:21  sdk  8:160  active ready running
  |- 1:0:3:21  sdn  8:208  active ready running
  |- 1:0:4:21  sdq  65:0   active ready running
  |- 1:0:5:21  sdt  65:48  active ready running
  `- 1:0:6:21  sdw  65:96  active ready running
Aug 14 09:36:35 | sdc: alua not supported
Aug 14 09:36:35 | sdf: alua not supported
Aug 14 09:36:35 | sdaf: alua not supported
Aug 14 09:36:35 | sdi: alua not supported
Aug 14 09:36:35 | sdl: alua not supported
Aug 14 09:36:35 | sdo: alua not supported
Aug 14 09:36:35 | sdr: alua not supported
Aug 14 09:36:35 | sdu: alua not supported
2221f000155c0792e dm-11 Promise,VTrak E830f
size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=-1 status=active
  |- 1:0:0:5   sdc  8:32   active ready running
  |- 1:0:1:5   sdf  8:80   active ready running
  |- 1:0:15:5  sdaf 65:240 active ready running
  |- 1:0:2:5   sdi  8:128  active ready running
  |- 1:0:3:5   sdl  8:176  active ready running
  |- 1:0:4:5   sdo  8:224  active ready running
  |- 1:0:5:5   sdr  65:16  active ready running
  `- 1:0:6:5   sdu  65:64  active ready running

So it seems that multipath can be made to work, but perhaps
the manual page could be enhanced a little to cover this case.

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 05a5e8ff..718dd16a 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1516,6 +1516,9 @@ handler to known devices (which includes all devices supporting SCSI-3 ALUA)
 and disallow changing the handler
 afterwards. Setting \fBhardware_handler\fR for such devices on these kernels
 has no effect.
+.PP
+If your device has been configured to disable ALUA support,
+\fBhardware_handler\fR will be set to \fI0\fR.
 .RE
 .
 .

Kind regards
Vince

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

